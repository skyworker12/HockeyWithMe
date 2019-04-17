//
//  ListOfGameResultsTWDataSource.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 17/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

class ListOfGameResultsTWDataSource: NSObject, UITableViewDataSource{
    
    var objects = [ShortResults]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoToFullGameInfo") as! ListOfGamesResultsCell
        
        cell.fillingCell(arrayWithData: [objects[indexPath.row]])
        cell.customizeCell()
        
        return cell
    }
    
   /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gameInfoVC = UIStoryboard(name: "GameStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameInfo") as? GameInfoViewController else {return}
        gameInfoVC.gameShortInfoArray = [self.objects[indexPath.row]]
        present(gameInfoVC, animated: true, completion: nil)
    }*/
}
