//
//  ExtendedOptions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 25/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
protocol ExtendedOptionsDelegate: class{
    func sendChosenDatesToParent(date: UserDates?)
    func sendChosenOneDateToParent(date: String?)
}
