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
       //cell.awayTeamLabel.text = listOfGameResultArray[indexPath.row].awayTeamName
        cell.fillingCell(arrayWithData: [listOfGameResultArray[indexPath.row]])
        cell.backgroundColor = UIColor.clear
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
        
    func showGamesResult(userDates: UserDates?, userDate: String?){
        self.createListOfResults.creatListOfGame(userDates: userDates, userDate: userDate, completion: {[unowned self](data, error) in
            if error != nil{
                self.downloadError = error
            }else{
                self.listOfGameResultArray = data
                print(self.listOfGameResultArray)
            }
        })
    }
    
   func sendChosenDatesToParent(date: UserDates?) {
       self.showGamesResult(userDates: date, userDate: nil)
    }
    
    func sendChosenOneDateToParent(date: String?){
        self.showGamesResult(userDates: nil, userDate: date)
    }
}

