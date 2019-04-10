//
//  DateRangeDefinder.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 01/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class DateRangeDefinder: DefineDate{
    func defineDateRange(_ array: [ShortResults]) -> UserDates{
        var dateRange: UserDates
        var datesSet = Set<String>()
        var datesArray = [String]()
        
        for i in array{
            var date = i.gameDate
            date.formatOnlyDate()
            datesSet.insert(date)
        }
        
        for i in datesSet.sorted(){
            datesArray.append(i)
        }
        
        dateRange = UserDates(startDate: datesArray[0], endDate: datesArray[datesArray.count - 1])
        
        return dateRange
    }
}
