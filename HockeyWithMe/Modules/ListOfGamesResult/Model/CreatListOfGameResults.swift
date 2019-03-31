//
//  File.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class CreatListOfGameResults: CreatListOfGame{
    var downloadListOfGameResults = DowloadListOfGamesResult()
    func creatListOfGame(userDates: UserDates?,userDate: String?,completion:@escaping ([ShortResults],Error?)->()){
        print("я туууууут")
        downloadListOfGameResults.downloadGamesResult(dates: userDates, date: userDate, completion: {(data, error) in
            var downloadDataArray = [ShortResults]()
            if let downloadError = error{
                completion(downloadDataArray, downloadError)
            }else if data != nil{
                for i in data!.dates{
                    let container = DateAndGamesStruct(date: i.date, games: i.games)
                    for item in container.games{
                        let containerTwo = ShortResults(gamePk: item.gamePk, gameDate: item.gameDate, gameStatus: item.status.abstractGameState, homeTeamName: item.teams.home.team.name, homeTeamScore: item.teams.home.score, awayTeamName: item.teams.away.team.name, awayTeamScore: item.teams.away.score)
                        downloadDataArray.append(containerTwo)
                    }
                }
                completion(downloadDataArray, nil)
            }
        })
    }
}
