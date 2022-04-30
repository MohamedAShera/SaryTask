//
//  BannerResponse.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import Foundation
// MARK: - HomeResponse

struct HomeResponse: Codable {
    let result: [HomeData]?
    let message: String?
    let status: Bool?
}

// MARK: - HomeData
struct HomeData: Codable {
    let link: String?
    let id: Int?
    let title: String?
    let image: String?
    let data: [HomeRowData]?
    let dataType: String?
    let showTitle: Bool?
    let uiType: String?
    let rowCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, title, data, link, image
        case dataType = "data_type"
        case showTitle = "show_title"
        case uiType = "ui_type"
        case rowCount = "row_count"
    }
}

// MARK: - HomeRowData
struct HomeRowData: Codable {
    let groupID: Int?
    let name: String?
    let image: String?

}

extension HomeRowData: HomeRowDataRepresentable {
    var rowImage: String {
        image.value
    }
    
    var rowTitle: String {
        name.value
    }
}

extension HomeData: HomeRepresentable {
    var numberOfItemInList: Int {
        self.data?.count ?? 1
    }
    
    var bannerImage: String {
        image.value
    }
    
    var bannerLink: String {
        link.value
    }
    
    var rowItems: [HomeRowDataRepresentable] {
        self.data ?? []
    }
    
    var itemTitle: String {
        title.value
    }
    
    var isTitleHidden: Bool {
        !showTitle.value
    }
    
    var homeUIType: HomeUIType {
        HomeUIType(rawValue: uiType.value) ?? .slider
    }
    
    var numberOfRow: Int {
        rowCount ?? 0
    }
    
    var homeDataType: HomeDataType {
        HomeDataType(rawValue: dataType.value) ?? .empty
    }
    
}
