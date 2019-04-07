//
//  ViewController.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class GameResultsViewController: UIViewController {
    @IBOutlet weak var listOfGameResultsView: ListOfGameView?
    
    lazy var refreshControl = UIRefreshControl()
    var createListOfResults = CreatListOfGameResults()
    var dateRangeDefinder = DateRangeDefinder()
    var listOfGameResultArray = [ShortResults](){
        didSet{
            DispatchQueue.main.async{
                guard let view = self.listOfGameResultsView else {return}
                view.listOfGameResultsTableView?.delegate = self
                view.listOfGameResultsTableView?.dataSource = self
                view.listOfGameResultsTableView?.reloadData()
                view.showTableView()
                view.changeDateLabel(self.dateRangeDefinder.defineDateRange(self.listOfGameResultArray))
                self.checkRefreshControlStatus()
            }
        }
    }
    var downloadError: Error?{
        didSet{
            DispatchQueue.main.async {
                self.creatErrorAlert(self.downloadError)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.listOfGameResultsView?.viewLayout()
        showGamesResult(userDates: nil, userDate: nil)
        configureRefreshControl()


    }
    
    @IBAction func showOptions(_ sender: Any) {
        guard let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVC") as? PopUpGameResultsViewController else {return}
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
        popUpVC.delegate = self
    }
}
