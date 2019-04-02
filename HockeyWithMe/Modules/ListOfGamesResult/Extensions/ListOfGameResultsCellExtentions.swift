//
//  ListOfGameResultsCellExtention.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 25/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
extension ListOfGamesResultsCell{
    func fillingCell(arrayWithData:[ShortResults]){
        self.awayTeamLabel.text = arrayWithData[0].awayTeamName
        self.homeTeamLabel.text = arrayWithData[0].homeTeamName
        self.awayTeamScoreLabel.text = String(arrayWithData[0].awayTeamScore)
        self.homeTeamScoreLabel.text = String(arrayWithData[0].homeTeamScore)
        self.gameStatusLabel.text = arrayWithData[0].gameStatus
        self.gameDateLabel.text = arrayWithData[0].gameDate
        self.gameDateLabel.text?.dateFormatter()
    }
    func customizeCell(){
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
