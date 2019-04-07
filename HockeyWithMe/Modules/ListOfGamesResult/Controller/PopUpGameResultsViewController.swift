//
//  PopUpGameResultsViewController.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 14/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class PopUpGameResultsViewController: UIViewController {
    
    @IBOutlet weak var popUpGameResultsView: PopUpGamesResultsView?
    let dateFormatter = DateFormatter()
    weak var delegate: ExtendedOptionsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("popUpGameResultsView did load")
        self.popUpGameResultsView!.moveIn()
        self.popUpGameResultsView?.datePicker.addTarget(self, action: #selector(chooseDate(_:)), for: .valueChanged)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.willMove(toParent: nil)
        self.removeFromParent()
    }
    
    //MARK: метод скрытия pop up
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != self.popUpGameResultsView!.optionsView{
            self.popUpGameResultsView!.animHide()
        }
    }
    
    //MARK: button actions
    @IBAction func searchResults(_ sender: Any) {
        self.sendDates()
    }
    
    @IBAction func closeOptionsView(_ sender: Any) {
        self.popUpGameResultsView!.animHide()
    }
    
    @IBAction func deleteChoosenDate(_ sender: Any) {
        self.popUpGameResultsView?.changeTextFieldValue(value: "")
    }
    
    @IBAction func chooseTodayDate(_ sender: Any) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.popUpGameResultsView?.datePicker.setDate(Date(), animated: false)
        guard let pickerDate = self.popUpGameResultsView?.datePicker.date else {return}
        self.popUpGameResultsView?.changeTextFieldValue(value: dateFormatter.string(from:pickerDate))
    }
    
    //MARK: target selectors
    @objc func chooseDate(_ sender: UIDatePicker) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.popUpGameResultsView?.changeTextFieldValue(value: dateFormatter.string(from: (sender.date)))
    }
    
    deinit {
        print("PopUpGameResultsViewController removed from the memory")
    }
}

