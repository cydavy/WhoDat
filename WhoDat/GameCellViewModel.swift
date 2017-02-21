//
//  GameCellViewModel.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import Foundation

class GameCellViewModel: NSObject {
    
    var game: Game?
    
    init(withGame game: Game?) {
        self.game = game
        super.init()
    }
    
    func awayTeamName() -> String {
        guard let playingTeams = game?.playingTeams else {
            return ""
        }

        for team in playingTeams {
            if let team = team as? Team,
                let city = team.city,
                let name = team.name, team.isHome?.boolValue == false {
                return "\(city) \(name)"
            }
                
        }
        return ""
    }
    
    func  homeTeamName() -> String {
        guard let playingTeams = game?.playingTeams else {
            return ""
        }
        
        for team in playingTeams {
            if let team = team as? Team,
                let city = team.city,
                let name = team.name, team.isHome?.boolValue == true {
                return "\(city) \(name)"
            }
            
        }
        return ""
    }
    
    func gameTime() -> String {
        return game?.time ?? ""
    }
    
    
    
}
