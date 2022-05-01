//
//  MockHomeListFilterUseCase.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//
@testable import SaryTask
import RxSwift
import RxCocoa

final class MockHomeListFilterUseCase: DisposeObject, HomeListFilterUseCaseContract {
    func execute(using response: [HomeRepresentable]) -> [HomeRepresentable] {
        return MockData.banner
    }
}

