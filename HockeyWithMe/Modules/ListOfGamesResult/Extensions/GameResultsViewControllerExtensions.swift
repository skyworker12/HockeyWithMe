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
        
    func showGamesResult(userDates: UserDates?){
        self.createListOfResults.creatListOfGame(userDates: userDates, completion: {[unowned self](data, error) in
            if error != nil{
                self.downloadError = error
            }else{
                self.listOfGameResultArray = data
                print(self.listOfGameResultArray)
            }
        })
    }
    
   func sendChosenDatesToParent(date: UserDates?) {
       self.showGamesResult(userDates: date)
    }
    
    func defineDateRange(_ array: [ShortResults]) -> UserDates{
        var dateRange = UserDates(startDate: "", endDate: "")
        var datesSet = Set<String>()
        var datesArray = [String]()
        
        for i in array{
            var date = i.gameDate
            date.formatOnlyDate()
            datesSet.insert(date)
        }
        for i in datesSet.sorted(){
            datesArray.append(i)
        }
        
        dateRange = UserDates(startDate: datesArray[0], endDate: datesArray[datesArray.count - 1])
        print(dateRange)
        return dateRange
    }
}

