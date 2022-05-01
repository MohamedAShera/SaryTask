//
//  BaseViewModel.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import RxSwift
import RxRelay
import NVActivityIndicatorView

class BaseViewModel: DisposeObject {
    var alertItemRelay = BehaviorRelay<AlertItem?>.init(value: nil)
    var stateRelay = BehaviorRelay<ViewModelState<BaseError>>.init(value: .idle)
    let indicator = NVActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 70, height: 70), type: .ballScaleMultiple, color: .purple)
    
    func startLoading() {
        indicator.startAnimating()
    }
    
    func stopLoading() {
        indicator.stopAnimating()
    }
}

