//
//  ListOfGameResultExtansions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
extension GameResultsViewController: UITableViewDelegate, UITableViewDataSource, ExtendedOptionsDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfGameResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "GoToFullGameInfo") as! ListOfGamesResultsCell
        cell.fillingCell(arrayWithData: [listOfGameResultArray[indexPath.row]])
        cell.customizeCell()
        return cell
    }
        
    func showGamesResult(userDates: UserDates?, userDate: String?){
        self.createListOfResults.creatListOfGame(userDates: userDates, userDate: userDate, completion: {[weak self](data, error) in
            if let error = error{
                self?.downloadError = error
            }else if let data = data{
                self?.listOfGameResultArray = data
            }
        })
    }
    
   func sendChosenDatesToParent(date: UserDates?) {
       self.showGamesResult(userDates: date, userDate: nil)
    }
    
    func sendChosenOneDateToParent(date: String?){
        self.showGamesResult(userDates: nil, userDate: date)
    }
    
    func creatErrorAlert(_ error: Error?){
        let alertController = UIAlertController(title: "Ошибка", message: error?.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ок", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

