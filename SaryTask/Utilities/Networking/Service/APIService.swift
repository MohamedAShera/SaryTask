//
//  APIService.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation
import RxSwift
import RxCocoa

final class APIService: NSObject, APIServiceContract {
    static let shared = APIService()
    
    private override init() {}
    
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> Observable<Result<T, BaseError>> {
        return Observable.create { observer in
            URLSession
                .shared
                .rx
                .response(request: request)
                .debug(request.url?.absoluteString)
                .subscribe(
                    onNext: { response in
                        let statusCode: Int = response.response.statusCode
                        
                        guard statusCode == 200 else {
                            observer.onCompleted()
                            return
                        }
                        
                        guard let decoded = try? decoder.decode(responseType, from: response.data) else {
                            observer.onCompleted()
                            return
                        }
                        
                        return observer.onNext(.success(decoded))
                    },
                    onError: { [weak self] error in
                        guard let _ = self else { return }
                        observer.onCompleted()
                    }
                )
        }
    }
}
