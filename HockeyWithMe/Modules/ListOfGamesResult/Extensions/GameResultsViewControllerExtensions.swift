//
//  ListOfGameResultExtansions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

extension GameResultsViewController: ExtendedOptionsDelegate{
    
    func sendChosenDatesToParent(date: UserDates?) {
        self.showGamesResult(userDates: date, userDate: nil)
        
        self.listOfGameResultsView?.hideTableView()
        
        self.listOfGameResultsView?.showActionIndicator()
    }
    
    func sendChosenOneDateToParent(date: String?){
        self.showGamesResult(userDates: nil, userDate: date)
        
        self.listOfGameResultsView?.hideTableView()
        
        self.listOfGameResultsView?.showActionIndicator()
        
    }
}

