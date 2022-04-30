//
//  APIServiceContract.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation
import RxSwift

protocol APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder
    ) -> Observable<Result<T, BaseError>>
}

extension APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> Observable<Result<T, BaseError>> {
        self.request(
            using: request,
            responseType: responseType,
            decoder: JSONDecoder()
        )
    }
}

