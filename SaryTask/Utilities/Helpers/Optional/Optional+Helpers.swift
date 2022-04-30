//
//  Optional+Helpers.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import Foundation

extension Optional where Wrapped == String {
    var value: String {
        return self ?? ""
    }
}

extension Optional {
    var isNil: Bool {
        self == nil
    }
    
    var isNotNil: Bool {
        !isNil
    }
}

extension Optional where Wrapped == String {
    /// return is Empty Or Nil value
    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }
}

extension Optional where Wrapped == Bool {
    /// return date if not nil Or retutn dafault value  `Bool` if nil
    var value: Bool {
        self ?? false
    }
}
