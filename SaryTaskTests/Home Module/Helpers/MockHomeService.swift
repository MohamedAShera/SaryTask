//
//  MockHomeService.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//

@testable import SaryTask
import RxSwift
import RxCocoa

final class MockHomeService: DisposeObject, HomeServiceContract {
    func getBanners() -> Observable<Result<HomeResponse, BaseError>> {
        let response = HomeResponse(
            result: MockData.banner,
            message: "sucess",
            status: true
        )
    
        return Observable.just(.success(response))
    }
    
    func getHomeLists() -> Observable<Result<HomeResponse, BaseError>> {
        let response = HomeResponse(
            result: MockData.banner,
            message: "sucess",
            status: true
        )
    
        return Observable.just(.success(response))
    }
}
