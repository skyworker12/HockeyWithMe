//
//  GetJSONClass.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 11/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class DowloadListOfGamesResult: DownoloadGamesResult{
    
    func downloadGamesResult(dates: UserDates?, date: String?, completion: @escaping (GameResults?,Error?) -> ()) {
        guard let url = URL(string: confirmUrl(dates: dates, date: date)) else {return}
        
            URLSession.shared.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
              do{
                if let data = data{
                    let containerForParsing = try JSONDecoder().decode(GameResults.self, from: data)
                    completion(containerForParsing, nil)
                }
                if let error = error{
                    completion(nil, error)
                }
              }catch let catchError{
                print(catchError)
              }
                }).resume()
    }
    
}

extension DowloadListOfGamesResult{
    private var urlResourse: String{
        return "https://statsapi.web.nhl.com/api/v1/schedule"
    }
    
    private func confirmUrl(dates: UserDates?, date: String?) -> String{
        var url: String
        
        if let dates = dates{
            url = ("\(urlResourse)?startDate=\(dates.startDate)&endDate=\(dates.endDate)")
        }else if let date = date{
            url = ("\(urlResourse)?date=\(date)")
        }else{
            url = urlResourse
        }
        
        return url
    }
}

