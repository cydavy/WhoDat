//
//  NetworkController.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkController: NSObject, NetworkProtocol {
    
    var requestHeader: HTTPHeaders?
    
    private let baseURL = "https://player-number.amandeep.ca/"
    private let gamesPath = "1/games.json"
    private let playersPath = "1/players.json"
    
    override init() {
        super.init()
        self.requestHeader = createRequestHeader()
    }
    
    func fetchTodaysGames(completion: @escaping ([Game]) -> Void) {
        Alamofire.request(baseURL.appending(gamesPath), headers: requestHeader).responseJSON { response in
            switch response.result {
            case .success(let value):
                let responseHeader = response.response?.allHeaderFields
                print(responseHeader?["Expires"])
                
                let jsonResponse = JSON(value)
                var games = [Game]()
                for (_, subJson): (String, JSON) in jsonResponse {
                    if let game = Game(fromJSON: subJson) {
                        games.append(game)
                    }
                }
                completion(games)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPlayersInTeam(completetion: @escaping ([Player]) -> Void) {
        

    }
}

private extension NetworkController {
    func createRequestHeader() -> HTTPHeaders? {
        let path: String? = Bundle.main.path(forResource: "secrets", ofType: nil)
        if let path = path,
            let data = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) {
            let secret = data.components(separatedBy: .newlines)[0]
            return ["x-api-key" : secret,
                    "Content-Length" : "0"]
        }
        return nil
    }
}
