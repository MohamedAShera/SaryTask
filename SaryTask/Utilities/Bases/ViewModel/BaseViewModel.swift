//
//  BaseViewModel.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import RxSwift
import RxRelay

class BaseViewModel: DisposeObject {
    var stateRelay = BehaviorRelay<ViewModelState<BaseError>>.init(value: .idle)
    var alertItemRelay = BehaviorRelay<AlertItem?>.init(value: nil)
}

