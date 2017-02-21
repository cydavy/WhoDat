//
//  NSFileManager+Util.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import Foundation

extension FileManager {
    func documentsDirectory() -> URL? {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentURL: URL = urls.first {
            return documentURL
        }
        
        return nil
    }
}
