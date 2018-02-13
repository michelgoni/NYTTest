//
//  RoundImage.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 12/02/2018.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import UIKit

class RoundedCornerView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
