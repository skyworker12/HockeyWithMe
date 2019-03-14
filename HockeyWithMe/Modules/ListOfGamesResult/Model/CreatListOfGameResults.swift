//
//  File.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class CreatListOfGameResults: CreatListOfGame{
    var getJson = GetJSON()
    func creatListOfGame(completion:@escaping ([MyStructTwo],Error?)->()){
        getJson.getJson(completion: {(data, error) in
            var downloadDataArray = [MyStructTwo]()
            if error != nil{
                completion(downloadDataArray, error)
               // print(error?.localizedDescription)
            }
            if data != nil{
                for i in data!.dates{
                    let container = MyStruct(date: i.date, games: i.games)
                    for item in container.games{
                        let containerTwo = MyStructTwo(gamePk: item.gamePk, gameDate: item.gameDate, gameStatus: item.status.abstractGameState, homeTeamName: item.teams.home.team.name, homeTeamScore: item.teams.home.score, awayTeamName: item.teams.away.team.name, awayTeamScore: item.teams.away.score)
                        downloadDataArray.append(containerTwo)
                    }
                }
                completion(downloadDataArray, nil)
            }
        })
    }
}
