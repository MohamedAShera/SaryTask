//
//  BaseViewController.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    deinit {
        print("deinit ", self.self)
    }
}
