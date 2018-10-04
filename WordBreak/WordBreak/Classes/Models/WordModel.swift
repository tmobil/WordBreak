//
//  WordModel.swift
//  WordBreak
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import Foundation

struct WordModel {
    
    var wordTitle: String?
    var wordDescription: [String]?
    
    init?(articleDict:(key: Any, value: Any))
    {
        guard let title = articleDict.key as? String else {
            return nil
        }
        guard let desc = articleDict.value as? [String] else {
            return nil
        }
        self.wordTitle = title
        self.wordDescription = desc
    }

}
