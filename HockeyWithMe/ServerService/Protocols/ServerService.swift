//
//  ServerServiceProtocols.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation

protocol DownoloadGamesResult: class{
    func downloadGamesResult(dates: UserDates?, date: String?, completion:@escaping (GameResults?,Error?)->Void)
}

