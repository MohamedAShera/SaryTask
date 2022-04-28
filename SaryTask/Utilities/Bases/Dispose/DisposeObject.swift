//
//  DisposeObject.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import RxSwift

class DisposeObject {
    var deinitCalled: (() -> Void)?
    var disposeBag: DisposeBag
    
    init() {
        self.disposeBag = DisposeBag()
    }
    
    deinit {
        deinitCalled?()
    }
}

