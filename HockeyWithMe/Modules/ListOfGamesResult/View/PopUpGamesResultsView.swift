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
    @IBOutlet weak var oneDateTextField: UITextField!
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
        self.datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    func editTextField(textField: UITextField, textFieldValue: TextFieldValue){
        switch textFieldValue{
        case .none:
            textField.shake()
        case .some:
            textField.layer.borderWidth = 0
        }
    }
    
    func changeTextFieldValue(value: String){
        switch optionsSegmentController.selectedSegmentIndex{
        case 0:
            self.startDateTextField.text = value
            self.editTextField(textField: startDateTextField, textFieldValue: .some)
        case 1:
            self.endDateTextField.text = value
            self.editTextField(textField: endDateTextField, textFieldValue: .some)
        case 2:
            self.oneDateTextField.text = value
            self.editTextField(textField: oneDateTextField, textFieldValue: .some)
        default:
            print("error")
        }
    }
    deinit {
        print("PopUpGamesResultsView removed from the memmory")
    }
}
