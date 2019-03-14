//
//  ListOfGameViewProtocol.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 22/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
protocol ListOfGameResultsViewProtocol{
    var listOfGameResultsTableView: UITableView? {get set}
}
protocol CreatListOfGame{
    func creatListOfGame(completion:@escaping ([MyStructTwo],Error?)->Void)
}
