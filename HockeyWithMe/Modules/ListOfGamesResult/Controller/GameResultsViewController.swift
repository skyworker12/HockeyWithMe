//
//  ViewController.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class GameResultsViewController: UIViewController {
    var createListOfResults = CreatListOfGameResults()
    var listOfGameResultArray = [ShortResults](){
        didSet{
            DispatchQueue.main.async{
                self.listOfGameResultsView!.listOfGameResultsTableView?.delegate = self
                self.listOfGameResultsView!.listOfGameResultsTableView?.dataSource = self
                self.listOfGameResultsView!.listOfGameResultsTableView?.reloadData()
                self.listOfGameResultsView?.changeDateLabel(self.defineDateRange(self.listOfGameResultArray))
            }
        }
    }
    var downloadError: Error?{
        didSet{
            print("Ошибка при загрузке")
        }
    }
    @IBOutlet weak var listOfGameResultsView: ListOfGameView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listOfGameResultsView?.viewLayout()
        showGamesResult(userDates: nil, userDate: nil)
        

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
