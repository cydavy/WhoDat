//
//  Player.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class Player: NSObject {
    let id: String?
    let lastName: String?
    let firstName: String?
    let age: String?
    let birthCity: String?
    let birthCountry: String?
    let birthDate: String?
    let gamesPlayed: String?
    let height: String?
    let isRookie: Bool?
    let jerseyNumber: NSInteger
    
    init?(fromJSON: JSON?) {
        guard let json = fromJSON else {
            return nil
        }
        
        id = json["id"].string
        lastName = json["lastName"].string
        firstName = json["firstName"].string
        age = json["age"].string
        birthCity = json["birthCity"].string
        birthCountry = json["birthCountry"].string
        birthDate = json["birthDate"].string
        gamesPlayed = json["gamesPlayed"].string
        height = json["height"].string
        isRookie = json["isRookie"].boolValue
        jerseyNumber = json["jerseyNumer"].intValue
    }
}
