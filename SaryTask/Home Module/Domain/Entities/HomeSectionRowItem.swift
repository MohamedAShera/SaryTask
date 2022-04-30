//
//  HomeSectionRowItem.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import RxDataSources
import RxSwift

struct HomeSectionRowItem {
    var items: [HomeSectionRowData]
    
    init(items: [HomeSectionRowData]) {
        self.items = items
    }
}

extension HomeSectionRowItem: SectionModelType {
    typealias Item = HomeSectionRowData
    
    init(original: HomeSectionRowItem, items: [Item]) {
        self = original
        self.items = items
    }
}

struct HomeSectionRowData {
    var smartSubject: BehaviorSubject<[HomeRowDataRepresentable]>
    var sectionData: HomeRepresentable
    
    init(
        smartSubject: [HomeRowDataRepresentable],
        sectionData: HomeRepresentable
        
    ) {
        self.smartSubject = .init(value: smartSubject)
        self.sectionData = sectionData
    }
}

