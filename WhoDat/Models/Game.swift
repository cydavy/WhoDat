//
//  Game.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class Game: NSObject {
    
    var id: String?
    var date: String?
    var time: String?
    var location: String?
    var league: String?
    var homeTeam: Team?
    var awayTeam: Team?
    
    private let kHomeTeamKey = "homeTeam"
    private let kAwayTeamKey = "awayTeam"

//    override var description:String {
//        return "id: " + id + "\n" +
//            "date: " + date + "\n" +
//            "time: " + time + "\n" +
//            "location: " + location + "\n" +
//            "league: " + league + "\n" +
//            "homeTeam: " + homeTeam + "\n"
//            "awayTeam: " + awayTeam + "\n"
//    }
    
    init?(fromJSON: JSON?) {
        guard let json = fromJSON else {
            return nil
        }
        print(json)
        
        id = json["id"].string
        date = json["date"].string
        time = json["time"].string
        location = json["location"].string
        league = json["league"].string
        homeTeam = Team(fromJSON: json[kHomeTeamKey])
        awayTeam = Team(fromJSON: json[kAwayTeamKey])
    }
}
