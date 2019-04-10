//
//  ListOfGameResultExtansions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
extension GameResultsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfGameResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "GoToFullGameInfo") as! ListOfGamesResultsCell
        
        cell.fillingCell(arrayWithData: [listOfGameResultArray[indexPath.row]])
        cell.customizeCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gameInfoVC = UIStoryboard(name: "GameStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameInfo") as? GameInfoViewController else {return}
        self.present(gameInfoVC, animated: true, completion: nil)
    }
    
}

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

