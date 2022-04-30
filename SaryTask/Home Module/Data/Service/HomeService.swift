//
//  HomeService.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import RxSwift

final class HomeService: DisposeObject {
    
    private let apiService: APIServiceContract
    
    init(
        apiService: APIServiceContract = APIService.shared
    ) {
        self.apiService = apiService
        super.init()
    }
}

//MARK: - HomeServiceContract

extension HomeService: HomeServiceContract {
    func getBanners() -> Observable<Result<HomeResponse, BaseError>> {
        let request = APIBuilder()
            .setPath(using: APIConstants.banner)
            .setMethod(using: .get)
            .build()
        
        return apiService
            .request(
                using: request,
                responseType: HomeResponse.self
            )
    }
    
    func getHomeLists() -> Observable<Result<HomeResponse, BaseError>> {
        let request = APIBuilder()
            .setPath(using: APIConstants.home)
            .setMethod(using: .get)
            .build()
        
        return apiService
            .request(
                using: request,
                responseType: HomeResponse.self
            )
    }
}
