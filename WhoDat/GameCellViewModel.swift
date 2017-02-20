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
        return game?.awayTeam?.teamName() ?? ""
    }
    
    func  homeTeamName() -> String {
        return game?.homeTeam?.teamName() ?? ""
    }
    
    func gameTime() -> String {
        return game?.time ?? ""
    }
    
    
    
}
