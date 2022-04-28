//
//  AlertAction.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

struct AlertAction {
    typealias Action = () -> Void
    
    let title: String
    let style: UIAlertAction.Style
    var action: Action?

    init(
        title: String,
        style: UIAlertAction.Style = .default,
        action: Action?
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}

extension AlertAction {
    var toUIAlertAction: UIAlertAction {
        UIAlertAction(
            title: title,
            style: style
        ) { _ in
            self.action?()
        }
    }
}

