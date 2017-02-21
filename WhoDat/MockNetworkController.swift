//
//  MockNetworkController.swift
//  WhoDat
//
//  Created by Davy Li on 2/19/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData
import UIKit

class MockNetworkController: NetworkProtocol {

    func fetchTodaysGames(completion: @escaping ([Game]) -> Void) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let dataController = appDelegate?.dataController
        
        if let path = Bundle.main.path(forResource: "mockresponse", ofType: "json"),
            let pathURL = URL(string: "file://\(path)"),
            let data = try? Data(contentsOf: pathURL, options: .mappedIfSafe),
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                let jsonResponse = JSON(json)
                var games = [Game]()
                for (_, subJson): (String, JSON) in jsonResponse {
                    if let mainContext = dataController?.mainContext {
                        let awayTeamJson = subJson["homeTeam"]
                        let awayTeam = NSEntityDescription.insertNewObject(forEntityName: "Team", into: mainContext) as? Team
                        awayTeam?.populate(fromJSON: awayTeamJson)
                        awayTeam?.isHome = false
                        
                        let homeTeamJson = subJson["awayTeam"]
                        let homeTeam = NSEntityDescription.insertNewObject(forEntityName: "Team", into: mainContext) as? Team
                        homeTeam?.populate(fromJSON: homeTeamJson)
                        homeTeam?.isHome = true
                        
                        let game: Game? = NSEntityDescription.insertNewObject(forEntityName: "Game", into: mainContext) as? Game
                        game?.populate(fromJson: subJson)
                        
                        if let homeTeam = homeTeam,
                            let awayTeam = awayTeam,
                            let game = game {
                            game.addToPlayingTeams(homeTeam)
                            game.addToPlayingTeams(awayTeam)

                            games.append(game)
                        }
                        
                        try? dataController?.mainContext.save()
                        }
                }
                completion(games)
        }
    }
    
    func fetchPlayersInTeam(completetion: @escaping ([Player]) -> Void) {
        if let path = Bundle.main.path(forResource: "mockresponse", ofType: "json"),
            let pathURL = URL(string: "file://\(path)"),
            let data = try? Data(contentsOf: pathURL, options: .mappedIfSafe),
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            
            let jsonResponse = JSON(json)
            
            var players = [Player]()
            for (_, subJson): (String, JSON) in jsonResponse {
//                if let player = Player(fromJSON: subJson) {
//                    players.append(player)
//                }
            }
            
            completetion(players)
        }
    }
}
