//
//  NetworkProtocol.swift
//  WhoDat
//
//  Created by Davy Li on 2/19/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func fetchTodaysGames(completion: @escaping ([Game]) -> Void)
    
}
