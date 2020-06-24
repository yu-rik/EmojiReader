//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by yurik on 6/22/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set (object: Emoji){
        self.emojiLabel.text = object.emoji
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }
}
