//
//  TitleCell.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    
    @IBOutlet weak var imagePicture: RoundedCornerView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var detailSection: NewDetailViewModelItem? {
        didSet {
            guard let detailSection = detailSection as? MostSharedDetailNew else { return  }
            titleLabel.text = detailSection.title
             imagePicture.loadImageWithURL(detailSection.picture!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
