//
//  ListOfGameView.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 21/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class ListOfGameView: UIView, ListOfGameResultsViewProtocol {
    
    @IBOutlet private weak var aboutDatesView: UIView?
    @IBOutlet private weak var gamesResultDateLabel: UILabel?
    @IBOutlet weak var listOfGameResultsTableView: UITableView?
    
    private var actionIndicator =  UIActivityIndicatorView()
    
    func viewLayout(){
        self.backgroundColor = UIColor(patternImage: UIImage(named: "nyu-dzhersi-devilz-new-jersey")!)
        self.contentMode = .center
        self.listOfGameResultsTableView?.backgroundColor = UIColor.clear
        self.aboutDatesView?.layer.borderWidth = 0.5
        self.aboutDatesView?.layer.borderColor = UIColor.white.cgColor
        self.configureActionIndicator()
    }
    func changeDateLabel(_ dates: UserDates){
        self.gamesResultDateLabel?.text = ("\(dates.startDate) - \(dates.endDate)")
    }
    func showTableView() {
        self.listOfGameResultsTableView?.isHidden = false
    }
    
    func hideTableView() {
        self.listOfGameResultsTableView?.isHidden = true
    }
    
    func showActionIndicator(){
        actionIndicator.startAnimating()
    }
    
    func hideActionIndicator(){
        actionIndicator.stopAnimating()
    }
    
    func configureActionIndicator(){
        
        actionIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        actionIndicator.center = self.center
        actionIndicator.hidesWhenStopped = true
        actionIndicator.style =
            UIActivityIndicatorView.Style.whiteLarge
        self.addSubview(actionIndicator)
    }
}
