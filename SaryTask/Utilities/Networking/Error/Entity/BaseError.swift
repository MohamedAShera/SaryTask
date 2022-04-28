//
//  BaseError.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import Foundation

struct BaseError: Error {
    let code: Int
    let message: String
}

extension BaseError: Equatable {}
