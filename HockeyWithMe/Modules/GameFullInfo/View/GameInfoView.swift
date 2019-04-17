//
//  GameInfoView.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class GameInfoView: UIView {
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var gameDateLabel: UILabel!
    @IBOutlet weak var gamePlaceLabel: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    
    func fillInfo(_ array: [ShortResults]){
        self.homeTeamNameLabel.text = array[0].homeTeamName
        self.awayTeamNameLabel.text = array[0].awayTeamName
        self.homeTeamScore.text = String(array[0].homeTeamScore)
        self.awayTeamScore.text = String(array[0].awayTeamScore)
        self.gameDateLabel.text = array[0].gameDate
        self.gameStatusLabel.text = array[0].gameStatus
        self.gamePlaceLabel.text = array[0].gamePlace
    }

}
