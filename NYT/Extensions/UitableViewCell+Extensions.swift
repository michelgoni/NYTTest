//
//  UitableViewCell+Extensions.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UITableView {
    
    func register<T: UITableViewCell>(_ :T.Type)  {
        
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("I am crashing since it´s impossible to deque a cell. Sorry")
        }
        return cell
    }
}
