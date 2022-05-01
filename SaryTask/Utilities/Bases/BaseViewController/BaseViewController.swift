//
//  BaseViewController.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit
import NVActivityIndicatorView
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    let indicator = NVActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 70, height: 70), type: .ballScaleMultiple, color: .purple)
    deinit {
        print("deinit ", self.self)
    }
}
