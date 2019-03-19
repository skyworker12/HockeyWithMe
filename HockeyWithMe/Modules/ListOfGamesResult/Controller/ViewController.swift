//
//  ViewController.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 08/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var createListOfResults = CreatListOfGameResults()
    var choosenDate: String{
        get{
            let value = "0"
            return value
        }
        set{
            print(newValue)
        }
    }
    var listOfGameResultArray = [MyStructTwo](){
        didSet{
            DispatchQueue.main.async{
                self.listOfGameResultsView!.listOfGameResultsTableView?.reloadData()
            }
        }
    }
    var downloadError: Error?{
        didSet{
            print("Ошибка при загрузке")
        }
    }
    @IBOutlet weak var listOfGameResultsView: ListOfGameView?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLayout()
        
        self.listOfGameResultsView!.listOfGameResultsTableView?.delegate = self
        self.listOfGameResultsView!.listOfGameResultsTableView?.dataSource = self
        
        createListOfResults.creatListOfGame(completion: {[unowned self](data, error) in
            if error != nil{
                self.downloadError = error
            }else{
                self.listOfGameResultArray = data
                print(self.listOfGameResultArray)
            }
        })
    }
    @IBAction func showOptions(_ sender: Any) {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVC") as? PopUpGameResultsViewController
        self.addChild(popUpVC!)
        popUpVC!.view.frame = self.view.frame
        self.view.addSubview(popUpVC!.view)
        popUpVC!.didMove(toParent: self)
        print(choosenDate)
    }
}
