//
//  HomeListFilterUseCase.swift
//  SaryTask
//
//  Created by mohamed shera on 30/04/2022.
//

import RxSwift

final class HomeListFilterUseCase: HomeListFilterUseCaseContract {
    func execute(using response: [HomeRepresentable]) -> [HomeRepresentable] {
        
        return response.filter({$0.homeDataType != .empty})
    }
}
