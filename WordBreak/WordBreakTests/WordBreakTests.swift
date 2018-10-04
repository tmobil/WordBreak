//
//  WordBreakTests.swift
//  WordBreakTests
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import XCTest
@testable import WordBreak

class WordBreakTests: XCTestCase {
    
    // Test Validate title of Home Screen.
    func testNaviationTitle() {
        var homeScreenTitle: String?
        XCTAssertNil(homeScreenTitle)
        
        homeScreenTitle = AppTitleString.homeScreenTitle
        XCTAssertEqual(homeScreenTitle, "WordBreak")
    }
    
    //Validate utils method for word contains in Dictionary.
    func testDictionaryContainsBool(){
        let wordString = "Ip"
        let wordString1 = "Dev"
        let wordDict : [String] = ["Ratnesh", "Infosys", "ios", "Ip", "mac"];
        
        let dictContains = Utils.dictionaryContains(wordString: wordString, dict: wordDict)
        let dictContains1 = Utils.dictionaryContains(wordString: wordString1, dict: wordDict)
        
        XCTAssertEqual(dictContains, true)
        XCTAssertEqual(dictContains1, false)
    }
    
    //Validate Model creation sucess
    func testModelCreationSucess()
    {
        let model = WordModel(articleDict: (key:"A" , value: ["a","c"]))
        XCTAssertNotNil(model)
    }
    
    //Validate Model creation failed.
    func testModelCreationFailed()
    {
        let model = WordModel(articleDict: (key:1 , value: ["a","c"]))
        XCTAssertNil(model)
    }
    
    //Validate Model creation success
    func testResponseParserSuccess() {
        let responseString = ["ADSS":["Any","AAe33"]]
        let wordModelCount = ParserHelper.parseResponse(responseDict: responseString).count
        XCTAssert(wordModelCount > 0, "Paring of string is success")
    }
    
    //Validate response parser failed.
    func testResponseParserFailed() {
        let responseString = ["1":3343]
        let wordModelCount = ParserHelper.parseResponse(responseDict: responseString).count
        XCTAssert(wordModelCount < 1, "Paring of string is failed, no data")
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
