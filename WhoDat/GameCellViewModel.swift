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
    
    func gameName() -> String {
        if let homeTeamName = game?.homeTeam?.teamName(),
            let awayTeamName = game?.awayTeam?.teamName() {
            return "\(homeTeamName) @ \(awayTeamName)"
        }
        return ""
    }
    
    func gameTimeAndLocation() -> String {
        if let gameTime = game?.time,
            let gameLocation = game?.location {
            return "\(gameLocation) - \(gameTime)"
        }
        return ""
    }
    
    
    
}
