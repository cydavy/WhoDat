//
//  ViewController.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let gameCellIdentifier = "gameCell"
    var gamesByLeague: [String : [Game]] = [String : [Game]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let networkController: NetworkProtocol = MockNetworkController()
        networkController.fetchTodaysGames { (games) in
            self.finishedLoading(games: games)
        }
        
        self.tableView.contentInset.top = 20
        self.tableView.register(GameCell.self, forCellReuseIdentifier: gameCellIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.gamesByLeague.keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedLeague = self.gamesByLeague.keys.sorted()
        let league = sortedLeague[section]
        if let gamesInLeague = gamesByLeague[league] {
            return gamesInLeague.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sortedLeague = self.gamesByLeague.keys.sorted()
        return sortedLeague[section].uppercased()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gameCellIdentifier, for: indexPath)
        
        let sortedLeague = self.gamesByLeague.keys.sorted()
        let league = sortedLeague[indexPath.section]
        
        if let game = self.gamesByLeague[league]?[indexPath.row],
            let homeTeamName = game.homeTeam?.teamName(),
            let awayTeamName = game.awayTeam?.teamName() {
            cell.textLabel?.text = "\(homeTeamName) @ \(awayTeamName)"
        }
        return cell
    }

}

extension ViewController {
    func finishedLoading(games: [Game]) {
        for game: Game in games {
            if let league = game.league {
                if self.gamesByLeague[league] == nil {
                    self.gamesByLeague[league] = [Game]()
                }
                self.gamesByLeague[league]?.append(game)
            }
        }
    }
}

