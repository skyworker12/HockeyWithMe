//
//  PopUpGameResultsViewControllerExtansions.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 18/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit
extension PopUpGameResultsViewController{
    func changeTextFieldValue(value: String){
        switch popUpGameResultsView?.optionsSegmentController.selectedSegmentIndex{
        case 0:
            self.popUpGameResultsView?.startDateTextField.text = value
            self.popUpGameResultsView?.startDateTextField.layer.borderWidth = 0
        case 1:
            self.popUpGameResultsView?.endDateTextField.text = value
            self.popUpGameResultsView?.endDateTextField.layer.borderWidth = 0
        case 2:
            self.popUpGameResultsView?.oneDateTextField.text = value
            self.popUpGameResultsView?.oneDateTextField.text = value
        default:
            print("error")
        }
    }
    
    func sendDates(){
        guard let startDate = popUpGameResultsView?.startDateTextField.text else {return}
        guard let endDate = popUpGameResultsView?.endDateTextField.text else {return}
        guard let oneDate = popUpGameResultsView?.oneDateTextField.text else {return}
        let userDate = (startDate, endDate, oneDate)
        switch userDate{
        case ("","", ""):
            self.popUpGameResultsView?.startDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.startDateTextField.layer.borderColor = UIColor.red.cgColor
            self.popUpGameResultsView?.endDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.endDateTextField.layer.borderColor = UIColor.red.cgColor
            self.popUpGameResultsView?.oneDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.oneDateTextField.layer.borderColor = UIColor.red.cgColor
        case (_,"", ""):
            self.popUpGameResultsView?.endDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.endDateTextField.layer.borderColor = UIColor.red.cgColor
            self.popUpGameResultsView?.oneDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.oneDateTextField.layer.borderColor = UIColor.red.cgColor
        case ("",_, ""):
            self.popUpGameResultsView?.startDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.startDateTextField.layer.borderColor = UIColor.red.cgColor
            self.popUpGameResultsView?.oneDateTextField.layer.borderWidth = 1
            self.popUpGameResultsView?.oneDateTextField.layer.borderColor = UIColor.red.cgColor
        case ("", "", _):
            delegate?.sendChosenOneDateToParent(date: oneDate)
            self.popUpGameResultsView!.animHide()
        default:
            delegate?.sendChosenDatesToParent(date: UserDates(startDate: startDate, endDate: endDate))
            self.popUpGameResultsView!.animHide()
        }
    }
}
