//
//  HomeRepository.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import RxSwift

final class HomeRepository: DisposeObject {
    private let service: HomeServiceContract
    
    init(service: HomeServiceContract = HomeService()) {
        self.service = service
        super.init()
    }
    
}

//MARK: - HomeRepositoryContract
extension HomeRepository: HomeRepositoryContract {
    func getBanners() -> Observable<Result<HomeResponse, BaseError>> {
        service
            .getBanners()
    }
    
    func getHomeLists() -> Observable<Result<HomeResponse, BaseError>> {
        service
            .getHomeLists()
    }
}
