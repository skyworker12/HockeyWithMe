//
//  ServerServiceProtocols.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
protocol GetJSONPRotocol{
    var urlResourse: String {get}
    func getJson(dates: UserDates?,completion:@escaping (GameResults?,Error?)->Void)
}

