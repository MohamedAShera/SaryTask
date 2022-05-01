//
//  ProgressDisplayer.swift
//  SaryTask
//
//  Created by mohamed shera on 01/05/2022.
//

import UIKit
import RxSwift
import RxCocoa
import NVActivityIndicatorView

protocol LoadingDisplayerProtocol {
    func showProgress(spinnerColor: UIColor)
    func hideProgress()
}

extension LoadingDisplayerProtocol where Self: BaseViewController {
    func bindLoadingIndicator(to status: BehaviorRelay<ViewModelState<BaseError>>) {
        status.subscribe { [weak self] status in
            guard let self = self else { return }
            status.element == .loading ? self.showProgress() : self.hideProgress()
        }.disposed(by: disposeBag)
    }
    
    func showProgress(
        spinnerColor: UIColor = .purple
    ) {
        guard let view = self.view else { return }
        indicator.color = spinnerColor
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.widthAnchor.constraint(equalToConstant: 40),
            indicator.heightAnchor.constraint(equalToConstant: 40),
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.indicator.startAnimating()
            self.view.isUserInteractionEnabled = false
            self.navigationController?.view.isUserInteractionEnabled = false
        }
    }
    
    func hideProgress() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            self.navigationController?.view.isUserInteractionEnabled = true
        }
    }
    
}


