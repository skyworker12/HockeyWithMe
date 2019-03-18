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
    override func viewDidLoad() {
        super.viewDidLoad()
        print("popUpGameResultsView did load")
        self.popUpGameResultsView!.moveIn()

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    //MARK: методы появления и скрытия pop up
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != self.popUpGameResultsView!.optionsView{
            //moveOut()
            self.popUpGameResultsView!.animHide()
        }
    }
    
    @IBAction func searchResults(_ sender: Any) {
    }
    @IBAction func closeOptionsView(_ sender: Any) {
        self.popUpGameResultsView!.animHide()
    }
    
    deinit {
        print("removed from the memory")
    }
}

