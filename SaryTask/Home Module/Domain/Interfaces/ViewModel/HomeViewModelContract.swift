//
//  HomeViewModelContract.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import RxSwift

typealias HomeViewModelContract = BaseViewModel & HomeViewModelInputContract& HomeViewModelOutputContract

protocol HomeViewModelInputContract {
    func fetchHomeData()
    func showAlert(for line: String?) 
    
}

protocol HomeViewModelOutputContract {
    func getSectionData(for row: Int) -> HomeSectionRowData?
    
}
