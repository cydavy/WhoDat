//
//  MockNetworkController.swift
//  WhoDat
//
//  Created by Davy Li on 2/19/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import Foundation
import SwiftyJSON

class MockNetworkController: NetworkProtocol {

    func fetchTodaysGames(completion: @escaping ([Game]) -> Void) {
        if let path = Bundle.main.path(forResource: "mockresponse", ofType: "json"),
            let pathURL = URL(string: "file://\(path)"),
            let data = try? Data(contentsOf: pathURL, options: .mappedIfSafe),
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                let jsonResponse = JSON(json)
                var games = [Game]()
                for (_, subJson): (String, JSON) in jsonResponse {
                    if let game = Game(fromJSON: subJson) {
                        games.append(game)
                    }
                }
                completion(games)
        }
    }
}
