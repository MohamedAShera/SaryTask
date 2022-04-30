//
//  HomeRepresentable.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation

protocol HomeRepresentable {
    var bannerImage: String { get }
    var bannerLink: String { get }
    var itemTitle: String { get }
    var isTitleHidden: Bool { get }
    var rowItems: [HomeRowDataRepresentable] { get }
    var homeUIType: HomeUIType { get }
    var numberOfRow: Int { get }
    var numberOfItemInList: Int { get }
    var homeDataType: HomeDataType { get }
}
//MARK: - Default Values
extension HomeRepresentable {
    var bannerImage: String {
        ""
    }
    
    var bannerLink: String {
        ""
    }
    
    var rowItems: [HomeRowDataRepresentable] {
        []
    }
    
    var itemTitle: String {
        ""
    }
    
    var isTitleHidden: Bool {
        true
    }
    
    var homeUIType: HomeUIType {
        .slider
    }
    
    var numberOfRow: Int {
        1
    }
    
    var homeDataType: HomeDataType {
        .banner
    }
}
