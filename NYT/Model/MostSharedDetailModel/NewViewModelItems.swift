//
//  ModelEnumForTable.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

enum NewDetailViewModelType {
    case titleAndPicture
    case section
    case abstract
    case url
}

protocol NewDetailViewModelItem {
    
    var type: NewDetailViewModelType {get}
    var rowCount: Int {get}
    var sectionTitle: String {get}
}

extension NewDetailViewModelItem {
    
    var rowCount: Int {
        return Constants.TableCount.newDetailDefaultRowCount
    }
}

