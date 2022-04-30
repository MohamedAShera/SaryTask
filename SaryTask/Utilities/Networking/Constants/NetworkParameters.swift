//
//  NetworkParameters.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation

/// Enumeration that represents type of Network Parameters
typealias Parameters = [String: Any]

enum RequestParams {
    case body(_: Parameters)
    case query(_: Parameters)
}
