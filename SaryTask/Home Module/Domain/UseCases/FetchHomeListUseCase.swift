//
//  FetchHomeListUseCase.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import RxSwift

final class FetchHomeListUseCase: DisposeObject, FetchHomeListUseCaseContract {
    private let repository: HomeRepositoryContract
    
    init(repository: HomeRepositoryContract = HomeRepository()) {
        self.repository = repository
        super.init()
    }
    
    func execute() -> Observable<Result<HomeResponse, BaseError>> {
        repository
            .getHomeLists()
    }
}
