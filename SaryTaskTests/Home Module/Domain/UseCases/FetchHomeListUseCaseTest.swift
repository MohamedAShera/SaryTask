//
//  FetchHomeListUseCaseTest.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//

@testable import SaryTask
import XCTest

class FetchHomeListUseCaseTest: XCTestCase {
    private var expectationDesc: String!
    private var sut: FetchHomeListUseCase!
    
    override func setUp() {
        super.setUp()
        expectationDesc = "FetchHomeListUseCaseTest"
        sut = FetchHomeListUseCase(repository: MockHomeRepository())
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
        sut.execute()
            .subscribe(onNext: { homeResult  in
                exp.fulfill()
                XCTAssertNotNil(homeResult)
                
            })
            .disposed(by: sut.disposeBag)

        // Then
        waitForExpectations(timeout: 1.0)
    }
}
