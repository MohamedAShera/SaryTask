//
//  FetchBannerUseCaseContract.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import RxSwift

protocol FetchBannerUseCaseContract {
    func execute() -> Observable<Result<HomeResponse, BaseError>>
}
