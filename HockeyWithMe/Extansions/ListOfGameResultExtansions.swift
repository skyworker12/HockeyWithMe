//
//  ListOfGameResultExtansions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
extension ViewController: UITableViewDelegate, UITableViewDataSource{
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
    
    func viewLayout(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nyu-dzhersi-devilz-new-jersey")!)
         self.view.contentMode = .center
        self.listOfGameResultsView.listOfGameResultsTableView?.backgroundColor = UIColor.clear
    }
}
extension ListOfGamesResultsCell{
    func fillingCell(arrayWithData:[MyStructTwo]){
        self.awayTeamLabel.text = arrayWithData[0].awayTeamName
        self.homeTeamLabel.text = arrayWithData[0].homeTeamName
        self.awayTeamScoreLabel.text = String(arrayWithData[0].awayTeamScore)
        self.homeTeamScoreLabel.text = String(arrayWithData[0].homeTeamScore)
        self.gameStatusLabel.text = arrayWithData[0].gameStatus
        //self.gameDateLabel.text = arrayWithData[0].gameDate.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)
        self.gameDateLabel.text = dateFormatter(date: arrayWithData[0].gameDate)
        
    }
    func dateFormatter(date:String) -> String{
       var formattedDate = date.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)
       formattedDate.removeLast(1)
      return formattedDate
    }
}
