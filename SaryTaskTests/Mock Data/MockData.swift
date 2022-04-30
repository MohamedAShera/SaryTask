//
//  MockData.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//

@testable import SaryTask
import Foundation
import RxSwift
import RxDataSources

enum MockData {
    static let homeRowData = HomeRowData(
        groupID: 1,
        name: "test",
        image: "test"
    )
    static let homeData = HomeData(
        link: "test",
        id: 1,
        title: "test",
        image: "test",
        data: [homeRowData],
        dataType: "test",
        showTitle: true,
        uiType: "test",
        rowCount: 0
    )
    static let banner: [HomeData] = [homeData]
}
