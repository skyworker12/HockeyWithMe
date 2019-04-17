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
    
    private var refreshControl = UIRefreshControl()
    private var createListOfResults: CreatListOfGame = CreatListOfGameResults()
    private var dateRangeDefinder: DefineDate = DateRangeDefinder()
    private var dataSource = ListOfGameResultsTWDataSource()

    var listOfGameResultArray = [ShortResults](){
        didSet{
            DispatchQueue.main.async{
                guard let view = self.listOfGameResultsView else {return}
                view.listOfGameResultsTableView?.dataSource = self.dataSource
                self.dataSource.objects = self.listOfGameResultArray
                view.listOfGameResultsTableView?.reloadData()
                view.hideActionIndicator()
                view.showTableView()
                view.changeDateLabel(self.dateRangeDefinder.defineDateRange(self.listOfGameResultArray))
                self.checkRefreshControlStatus()
            }
        }
    }
    
    private var downloadError: Error?{
        didSet{
            DispatchQueue.main.async {
                guard let view = self.listOfGameResultsView else {return}
                view.hideActionIndicator()
                self.creatErrorAlert(self.downloadError)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listOfGameResultsView?.viewLayout()
        self.listOfGameResultsView?.showActionIndicator()
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
    
  func showGamesResult(userDates: UserDates?, userDate: String?){
        self.createListOfResults.creatListOfGame(userDates: userDates, userDate: userDate, completion: {[weak self](data, error) in
            
            if let error = error{
                self?.downloadError = error
            }else if let data = data{
                
                switch data.isEmpty{
                case true:
                    DispatchQueue.main.async {
                        self?.createEmtyArrayAlert()
                        guard let view = self?.listOfGameResultsView else {return}
                        view.hideActionIndicator()
                    }
                case false:
                    self?.listOfGameResultArray = data
                }
            }
        })
    }
    
    private func creatErrorAlert(_ error: Error?){
        let alertController = UIAlertController(title: "Ошибка", message: error?.localizedDescription, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ок", style: .default))
        
        alertController.addAction(UIAlertAction(title: "Повторить", style: .default, handler:{[weak self] action in
            
            self?.showGamesResult(userDates: nil, userDate: nil)
            self?.listOfGameResultsView?.showActionIndicator()
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
        checkRefreshControlStatus()
        
    }
    
   private func createEmtyArrayAlert(){
        let alertController = UIAlertController(title: "Упс", message: "Cегодня матчей нет :(", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Понятно", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
        checkRefreshControlStatus()
    }
    
   private func configureRefreshControl(){
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        self.listOfGameResultsView?.listOfGameResultsTableView?.addSubview(refreshControl)
    }
    
    @objc func refreshTableView(){
        self.showGamesResult(userDates: nil, userDate: nil)
    }
    
    private func checkRefreshControlStatus(){
        if self.refreshControl.isRefreshing{
            self.refreshControl.endRefreshing()
        }
    }

}
