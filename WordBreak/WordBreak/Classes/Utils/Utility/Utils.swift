//
//  Utils.swift
//  WordBreak
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import Foundation

class Utils {
    
    // Adding function Dictionay have word or not.
    static func dictionaryContains(wordString: String, dict: [String]) -> Bool {
        for str in dict {
            if str.lowercased() == wordString.lowercased() {
                return true
            }
        }
        return false
    }
    
}
