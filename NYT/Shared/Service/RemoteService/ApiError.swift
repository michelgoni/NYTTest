//
//  ApiError.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

enum ApiError: Error {
    
    case requestFailed
    case jsonParsingFailure
    case invalidData
    case responseUnsuccessful
    
    var localizedDescription: String {
        
        switch  self {
        case .requestFailed: return "Request failed. Check your connection."
        case .jsonParsingFailure: return "JSON Parsing disaster"
        case .invalidData: return "Invalid data from server"
        case .responseUnsuccessful: return "Reponse was not what we expected... uh?"
        }
    }
}
