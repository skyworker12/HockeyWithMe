//
//  PopUpGamesResultsView.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 14/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class PopUpGamesResultsView: UIView {
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var searchResultsButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    func moveIn(){
        self.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.optionsView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.90)
        self.optionsView.layer.cornerRadius = 20
        self.animShow()
        self.searchResultsButton.layer.cornerRadius = 20
        self.searchResultsButton.layer.borderWidth = 2
        self.searchResultsButton.layer.borderColor = UIColor.lightGray.cgColor
    }
}
