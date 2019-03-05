//
//  GetJSONClass.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 11/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class GetJSON: GetJSONPRotocol{
    var urlResourse: String{
        return "https://statsapi.web.nhl.com/api/v1/schedule/"
    }
    func getJson(completion: @escaping (GameResults?,Error?) -> ()) {
        let url = URL(string: urlResourse)
        if url != nil{
            URLSession.shared.dataTask(with: url!, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
              do{
                if let data = data{
                    //let gettingEntries = String(data: data, encoding: .utf8)
                    //print("respondingString = \(String(describing: gettingEntries))")
                    let containerForParsing = try JSONDecoder().decode(GameResults.self, from: data)
                    //print(containerForParsing)
                    completion(containerForParsing, nil)
                }
                if let error = error{
                    print("error while getting data")
                    completion(nil, error)
                }
              }catch let catchError{
                print(catchError)
                print("fdfdfdfd")
              }
                }).resume()
        }else{
            print("Передан пустой url")
        }
    }
}
