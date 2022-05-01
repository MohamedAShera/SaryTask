//
//  HomeListFilterUseCaseTest.swift
//  SaryTaskTests
//
//  Created by mohamed shera on 30/04/2022.
//

@testable import SaryTask
import XCTest

class HomeListFilterUseCaseTest: XCTestCase {
    private var sut: HomeListFilterUseCase!
    
    override func setUp() {
        super.setUp()
        sut = HomeListFilterUseCase()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenExcuteIsCalled_dataAreFilter() {
        // Given
        // When
        let result = sut.execute(using: MockData.banner)
        
        // Then
        XCTAssertNotNil(result)
    }
}
