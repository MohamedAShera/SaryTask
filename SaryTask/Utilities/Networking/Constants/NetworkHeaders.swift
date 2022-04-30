//
//  NetworkHeaders.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation

/// Enumeration that represents types of Network Headers
typealias HTTPHeaders = [String: String]

enum HTTPHeader {
    static let contentType = "Content-Type"
    static let clientID = "client_id"
}

