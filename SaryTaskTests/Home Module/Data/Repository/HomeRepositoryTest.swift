//
//  HomeRepositoryTest.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//

@testable import SaryTask
import XCTest

class HomeRepositoryTest: XCTestCase {
    private var expectationDesc: String!
    private var sut: HomeRepository!
    
    override func setUp() {
        super.setUp()
        expectationDesc = "HomeRepositoryTest"
        sut = HomeRepository(service: MockHomeService())
    }
    
    override func tearDown() {
        sut = nil
        expectationDesc = nil
        super.tearDown()
    }
    
    func testSUT_whenFetchHomeIsCalled_dataAreRecieved() {
        // Given
        let exp = expectation(description: expectationDesc)
        
        // When
         sut.getHomeLists()
            .subscribe(onNext: { homeResult  in
                exp.fulfill()
                XCTAssertNotNil(homeResult)
                
            })
            .disposed(by: sut.disposeBag)

        // Then
        waitForExpectations(timeout: 1.0)
    }
    
    func testSUT_whenFetchBannerIsCalled_dataAreRecieved() {
        // Given
        let exp = expectation(description: expectationDesc)
        
        // When
         sut.getBanners()
            .subscribe(onNext: { bannerResult  in
                exp.fulfill()
                XCTAssertNotNil(bannerResult)
                
            })
            .disposed(by: sut.disposeBag)

        // Then
        waitForExpectations(timeout: 1.0)
    }
}
