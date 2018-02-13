//
//  UrlCell.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit
class URLCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    var detailSection: NewDetailViewModelItem? {
        didSet {
            guard let detailSection = detailSection as? MostSharedDetailUrl else { return  }
            dateLabel.text = detailSection.url
            
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

