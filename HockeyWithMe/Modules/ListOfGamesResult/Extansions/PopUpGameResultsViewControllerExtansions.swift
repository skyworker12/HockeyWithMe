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
        case 1:
            self.popUpGameResultsView?.endDateTextField.text = value
        default:
            print("error")
        }

    }
}
