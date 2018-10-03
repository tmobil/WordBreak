//
//  WebServiceManager.swift
//  WordBreak
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Ratnesh. All rights reserved.
//

import Foundation

class WordBreakAPI: NSObject {

    func getDictionaryJsonDataAPI(success: @escaping ([String:Any]) -> Void, failure:@escaping (String) -> Void) {
        guard let url = URL(string : ApiUrl.JSON_URL) else {
            DispatchQueue.main.async {
                failure(Message.fatalError)
            }
            return
        }
        
        let request = NSMutableURLRequest(url: url)

        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)-> Void in
            guard error == nil else {
                DispatchQueue.main.async {
                    failure(Message.connectivity)
                }
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    failure(Message.tryAfterSomeTime)
                }
                return
            }
            
            if httpURLResponse.statusCode == 200 {
                var jsonDict: [String: Any] = [:]

                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        
//                        print(json)
                        
                        if let dict = json as? Dictionary<String, Any> {
                            jsonDict = dict
                        }
                        
                    } catch _ as NSError {
                        DispatchQueue.main.async {
                            failure(Message.somethingWentWrong)
                        }
                        return
                    }
                }
                
                DispatchQueue.main.async {
                    success(jsonDict)
                }
            }
            
        })
        task.resume()
    }
}

