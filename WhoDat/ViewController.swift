//
//  ViewController.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    let gameCellIdentifier = "gameCell"
    var gamesByLeague: [String : [GameCellViewModel]] = [String : [GameCellViewModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.backgroundView?.addSubview(self.loadingIndicator)
        self.loadingIndicator.startAnimating()
        
        weak var weakSelf: ViewController? = self
        let networkController: NetworkProtocol = MockNetworkController()
//        let networkController: NetworkProtocol = NetworkController()
        networkController.fetchTodaysGames { (games) in
            weakSelf?.loadingIndicator.stopAnimating()
            weakSelf?.finishedLoading(games: games)
        }
        
        self.tableView.contentInset.top = 20
        self.tableView.register(GameCell.self, forCellReuseIdentifier: gameCellIdentifier)
    }
    
}

extension ViewController {
    
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
        let gameCellViewModel = self.gamesByLeague[league]?[indexPath.row]
        
        cell.textLabel?.text = gameCellViewModel?.gameName()
        cell.detailTextLabel?.text = gameCellViewModel?.gameTimeAndLocation()
    
        return cell
    }
}

extension ViewController {
    func finishedLoading(games: [Game]) {
        for game: Game in games {
            if let league = game.league {
                if self.gamesByLeague[league] == nil {
                    self.gamesByLeague[league] = [GameCellViewModel]()
                }
                self.gamesByLeague[league]?.append(GameCellViewModel(withGame: game))
            }
        }
        self.tableView?.reloadData()
    }
}

