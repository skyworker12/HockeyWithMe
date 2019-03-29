//
//  ListOfGameView.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 21/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class ListOfGameView: UIView, ListOfGameResultsViewProtocol {
    
    @IBOutlet weak var aboutDatesView: UIView?
    @IBOutlet weak var gamesResultDateLabel: UILabel?
    @IBOutlet weak var listOfGameResultsTableView: UITableView?
    
    func viewLayout(){
        self.backgroundColor = UIColor(patternImage: UIImage(named: "nyu-dzhersi-devilz-new-jersey")!)
        self.contentMode = .center
        self.listOfGameResultsTableView?.backgroundColor = UIColor.clear
        self.aboutDatesView?.layer.borderWidth = 0.5
        self.aboutDatesView?.layer.borderColor = UIColor.white.cgColor
    }
    func changeDateLabel(_ dates: UserDates){
        self.gamesResultDateLabel?.text = ("\(dates.startDate) - \(dates.endDate)")
    }
}
