//
//  NSObject+Helpers.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import Foundation
import Foundation

extension NSObject {
    /// Returns the receiver's classname as a string, not including the namespace.
    class var classNameWithoutNamespaces: String {
        return String(describing: self)
    }
}
