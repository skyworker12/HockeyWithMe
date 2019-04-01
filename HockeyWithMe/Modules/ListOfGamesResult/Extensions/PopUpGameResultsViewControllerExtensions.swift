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

    func sendDates(){
        guard let startDate = popUpGameResultsView?.startDateTextField.text else {return}
        guard let endDate = popUpGameResultsView?.endDateTextField.text else {return}
        guard let oneDate = popUpGameResultsView?.oneDateTextField.text else {return}
        guard let view = popUpGameResultsView else {return}
        let userDate = (startDate, endDate, oneDate)
        switch userDate{
        case ("","", ""):
            view.editTextField(textField: view.startDateTextField, textFieldValue: .none)
            view.editTextField(textField: view.endDateTextField, textFieldValue: .none)
            view.editTextField(textField: view.oneDateTextField, textFieldValue: .none)
        case (_,"", ""):
            view.editTextField(textField: view.endDateTextField, textFieldValue: .none)
            view.editTextField(textField: view.oneDateTextField, textFieldValue: .none)
        case ("",_, ""):
            view.editTextField(textField: view.startDateTextField, textFieldValue: .none)
            view.editTextField(textField: view.oneDateTextField, textFieldValue: .none)
        case ("", "", _):
            delegate?.sendChosenOneDateToParent(date: oneDate)
            view.animHide()
        default:
            delegate?.sendChosenDatesToParent(date: UserDates(startDate: startDate, endDate: endDate))
            view.animHide()
        }
    }
}
