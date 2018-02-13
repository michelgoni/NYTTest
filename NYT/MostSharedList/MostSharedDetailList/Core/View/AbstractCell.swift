//
//  AbstractCell.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

class AbstractCell: UITableViewCell {

    @IBOutlet weak var abstractLabel: UILabel!
    var detailSection: NewDetailViewModelItem? {
        didSet {
            guard let detailSection = detailSection as? MostSharedDetailAbstract else { return  }
            abstractLabel.text = detailSection.abstract
            
        }
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
