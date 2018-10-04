//
//  ParserHelper.swift
//  WordBreak
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import Foundation

final class ParserHelper {
    
    static func parseResponse(responseDict:[String:Any]) -> [WordModel] {
        var dataModels = [WordModel]()
        for obj in responseDict {
            if let varModelObj = WordModel(articleDict: (obj.key, obj.value)) {
                dataModels.append(varModelObj)
            }
        }
        return dataModels
    }
}

