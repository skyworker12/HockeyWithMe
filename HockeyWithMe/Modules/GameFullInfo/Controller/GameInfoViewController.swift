//
//  GameInfoViewController.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/04/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class GameInfoViewController: UIViewController {

    @IBOutlet var gameInfoView: GameInfoView!
    
    var gameShortInfoArray = [ShortResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameInfoView.fillInfo(self.gameShortInfoArray)

    }
}
