//
//  SectionCell.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {

    @IBOutlet weak var sectionLabel: UILabel!
    
    var detailSection: NewDetailViewModelItem? {
        didSet {
            guard let detailSection = detailSection as? MostSharedDetailSection else { return  }
            sectionLabel.text = detailSection.section
            
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
