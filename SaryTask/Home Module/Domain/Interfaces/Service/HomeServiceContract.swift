//
//  HomeServiceContract.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import RxSwift

protocol HomeServiceContract {
    func getBanners() -> Observable<Result<HomeResponse, BaseError>>
    func getHomeLists() -> Observable<Result<HomeResponse, BaseError>>
}
