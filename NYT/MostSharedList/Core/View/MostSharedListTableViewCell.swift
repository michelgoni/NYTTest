//
//  MostSharedListTableViewCell.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

class MostSharedListTableViewCell: UITableViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newTitle: UILabel!
    @IBOutlet weak var newSection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(_ newViewModel: MostSharedList?) {
        guard let newViewModel = newViewModel,  let image = newViewModel.image, let title = newViewModel.title, let section = newViewModel.section else { return }
       
        newImage.loadImageWithURL(image)
        newTitle.text = title
        newSection.text = section
    } 
}
