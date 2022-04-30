//
//  HomeListFilterUseCaseContract.swift
//  SaryTask
//
//  Created by mohamed shera on 30/04/2022.
//

import RxSwift

protocol HomeListFilterUseCaseContract {
    func execute(from response: [HomeRepresentable]) -> [HomeRepresentable]
}
