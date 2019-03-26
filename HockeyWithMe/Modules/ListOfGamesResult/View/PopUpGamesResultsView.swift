//
//  PopUpGamesResultsView.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 14/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class PopUpGamesResultsView: UIView {
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var searchResultsButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var optionsSegmentController: UISegmentedControl!
    @IBOutlet weak var deleteItemButton: UIBarButtonItem!
    @IBOutlet weak var todayItemButton: UIBarButtonItem!
    
    func moveIn(){
        self.animShow()
        self.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.optionsView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.90)
        self.optionsView.layer.cornerRadius = 20
        self.searchResultsButton.layer.cornerRadius = 20
        self.searchResultsButton.layer.borderWidth = 2
        self.searchResultsButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    deinit {
        print("PopUpGamesResultsView removed from the memmory")
    }
}
