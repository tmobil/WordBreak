//
//  Constants.swift
//  WordBreak
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import Foundation

struct AppTitleString {
    static let homeScreenTitle = "WordBreak"
}

struct Message {
    static let fatalError = "FATAL ERROR"
    static let connectivity = "Check your connectivity, Try after sometime!"
    static let tryAfterSomeTime = "Try after sometime!"
    static let somethingWentWrong = "Something went wrong."
    static let noSongs = "Currently songs are not avilable"
}

struct AppResultString {
    static let reusltTrueDetails = "The input can be separted as "
    static let reusltFalseDetails = "The input cannot be separated by any valid words."
}


enum ApiUrl {
    static let DOMAIN_URL = "https://raw.githubusercontent.com/"
    static let JSON_URL = DOMAIN_URL + "tmobil/WordBreak/master/english.json"

}
