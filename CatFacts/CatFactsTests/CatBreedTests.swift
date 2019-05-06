//
//  CatBreedTests.swift
//  CatFactsTests
//
//  Created by Marek Matulski on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import XCTest
import Nimble
@testable import CatFacts

class CatBreedTests: XCTestCase {

    private let sampleData = SampleData()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreatingBreed01() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let json = sampleData.breed01JSON
        do {
            let sampleBreed = try CatBreed(json: json)
            expect(sampleBreed.breed).to(equal("Abyssinian"))
        } catch {
            fail("should not throw error: \(error)")
        }
    }

    func testCreatingInvlidBreed() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let json = sampleData.breedInvalidJSON
        expect(try CatBreed(json: json)).to(throwError(errorType: AppError.self))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
