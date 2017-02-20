//
//  Team.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class Team: NSObject {
    
    var id: String?
    var city: String?
    var name: String?
    var abbreviation: String?
    var league: String?
    var colour: String?
    
//    override var description:String {
//        return "id: " + id + "\n" +
//               "city: " + city + "\n" +
//               "name: " + name + "\n" +
//               "abbreviation: " + name + "\n" +
//               "league: " + league + "\n" +
//               "colour: " + colour + "\n"
//    }
    
    init?(fromJSON: JSON?) {
        guard let json = fromJSON else {
            return nil
        }
        
        id = json["id"].string
        city = json["city"].string
        name = json["name"].string
        abbreviation = json["abbreviation"].string
        league = json["league"].string
        colour = json["colour"].string
    }
    
    func teamName() -> String? {
        if let city = self.city,
            let name = self.name {
            return "\(city) \(name)"
        }
        return nil
    }

}
