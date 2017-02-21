//
//  GameCell.swift
//  WhoDat
//
//  Created by Davy Li on 1/14/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var awayTeamLogoImage: UIImageView?
    @IBOutlet weak var homeTeamLogoImage: UIImageView?
    
    @IBOutlet weak var awayTeamName: UILabel?
    @IBOutlet weak var homeTeamName: UILabel?
    
    @IBOutlet weak var gameDate: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(withGameCellViewModel gameCellViewModel: GameCellViewModel?) {
        if let gameCellViewModel = gameCellViewModel {
            self.awayTeamName?.text = gameCellViewModel.awayTeamName()
            self.homeTeamName?.text = gameCellViewModel.homeTeamName()
            self.gameDate?.text = gameCellViewModel.gameTime()
        }
    }
}
