//
//  StringExtensions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 25/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
extension String{
    mutating func dateFormatter(){
        var formattedDate = self.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)
        formattedDate.removeLast(1)
        self = formattedDate
    }
}
