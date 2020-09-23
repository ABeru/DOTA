//
//  GameCell.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/21/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    @IBOutlet weak var team1: UIImageView!
    @IBOutlet weak var team2: UIImageView!
    @IBOutlet weak var best: UILabel!
    @IBOutlet weak var best1: UILabel!
    @IBOutlet weak var game1: UIButton!
    @IBOutlet weak var game2: UIButton!
    @IBOutlet weak var game3: UIButton!
    @IBOutlet weak var game4: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    var didTapGame1: (() -> Void)?
    var didTapGame2: (() -> Void)?
    var didTapGame3: (() -> Void)?
    var didTapGame4: (() -> Void)?
    @IBAction func game1On(_ sender: UIButton) {
        didTapGame1?()
    }
    @IBAction func game2On(_ sender: UIButton) {
        didTapGame2?()
    }
    @IBAction func game3On(_ sender: UIButton) {
        didTapGame3?()
    }
    @IBAction func game4On(_ sender: UIButton) {
        didTapGame4?()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
