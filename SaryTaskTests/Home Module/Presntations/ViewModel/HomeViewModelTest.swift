//
//  HomeViewModelTest.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//
@testable import SaryTask
import XCTest

class HomeViewModelTest: XCTestCase {
    private var sut: HomeViewModel!
    private var expectationDesc: String!
    
    override func setUp() {
        super.setUp()
        expectationDesc = "HomeViewModelTest"
        sut = HomeViewModel(
            fetchBannersUseCase: MockFetchBannerUseCase(),
            fetchHomeListUseCase: MockFetchHomeListUseCase(),
            homeListFilterUseCase: MockHomeListFilterUseCase()
        )
    }
    
    override func tearDown() {
        sut = nil
        expectationDesc = nil
        super.tearDown()
    }
    
    func testSUT_whenFetchDataCalled_homeDataAreRecieved() {
        // Given
        let exp = expectation(description: expectationDesc)
        
        // When
        sut.fetchHomeData()
        sut.sections
            .subscribe(onNext: { homeResult  in
                exp.fulfill()
                XCTAssertNotNil(homeResult)
                
            })
            .disposed(by: sut.disposeBag)
        
        // Then
        waitForExpectations(timeout: 1.0)
        
    }
    
    func testSUT_whenFetchDataCalled_bannerDataAreRecieved() {
        // Given
        let exp = expectation(description: expectationDesc)
        
        // When
        sut.fetchHomeData()
        sut.banner
            .subscribe(onNext: { bannerResult  in
                exp.fulfill()
                XCTAssertNotNil(bannerResult)
                
            })
            .disposed(by: sut.disposeBag)
        
        // Then
        waitForExpectations(timeout: 1.0)
        
    }
}
