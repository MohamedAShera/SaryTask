//
//  APIBuilder.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation

class APIBuilder {
    private(set) var urlRequest: URLRequest
    
    init() {
        guard let url = URL(string: NetworkConstants.baseUrl) else {
            fatalError("Could not create URL: \(NetworkConstants.baseUrl)")
        }
        
        self.urlRequest = URLRequest(url: url)
    }
    
    @discardableResult
    func setHost(using host: String) -> APIBuilder {
        self.urlRequest.url = URL(string: host)
        return self
    }
    
    @discardableResult
    public func setPath(using path: APIConstants) -> APIBuilder {
        setPath(using: path, argument: [])
        return self
    }
    
    @discardableResult
    public func setPath(using path: APIConstants, argument: CVarArg) -> APIBuilder {
        setPath(using: path, argument: [argument])
    }
    
    @discardableResult
    public func setPath(using path: APIConstants, argument: [CVarArg]) -> APIBuilder {
        self.setPath(using: path.rawValue.localizedFormat(using: argument))
        return self
    }
    
    @discardableResult
    func setMethod(using method: HTTPMethod) -> APIBuilder {
        self.urlRequest.httpMethod = method.rawValue
        return self
    }
    
    @discardableResult
    func setHeaders(using headers: HTTPHeaders) -> APIBuilder {
        for (key, value) in headers {
            self.urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        return self
    }
    
    @discardableResult
    func setParameters(using parameters: RequestParams) -> APIBuilder {
        switch parameters {
        case .body(let params):
            do {
                self.urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                fatalError("Could not serialize \(params)")
            }
            
        case .query(let params):
            let queryParams = params.map { pair in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            
            if let url = self.urlRequest.url {
                var components = URLComponents(string: url.absoluteString)
                components?.queryItems = queryParams
                
                self.urlRequest.url = components?.url
            }
        }
        
        return self
    }
    
    func build() -> URLRequest {
        guard
            let url = self.urlRequest.url,
            !url.pathComponents.isEmpty
        else {
            fatalError("API should contain at least one path.")
        }
        
        let headers: HTTPHeaders = getDefaultHeader()
        setHeaders(using: headers)
        
        self.urlRequest.setValue(ContentType.json, forHTTPHeaderField: HTTPHeader.contentType)
        
        return self.urlRequest
    }
}

private extension APIBuilder {
    private func getDefaultHeader() -> HTTPHeaders {
        return [
            "Device-Type": "ios",
            "App-Version" : "5.5.0.0.0",
            "Accept-Language" : "ar",
            "Platform" : "FLAGSHIP",
            "Authorization" : "token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MjgxNTEyLCJ1c2VyX3Bob25lIjoiOTY2NTkxMTIyMzM0In0.phRQP0e5yQrCVfZiN4YlkI8NhXRyqa1fGRx5rvrEv0o"
        ]
    }
    func setPath(using path: String) {
        let base: URL? = self.urlRequest.url
        let baseAppend = base?.appendingPathComponent(path).absoluteString.removingPercentEncoding
        guard let baseAppend = baseAppend, let newURL = URL(string: baseAppend) else { return }
        self.urlRequest.url = newURL
    }
}
