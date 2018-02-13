//
//  Container.swift
//  NYT
//
//  Created by Miguel Goñi on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

final class Container {
    
    static let shared = Container()
    
    func mostSharedListBuilder() -> MostSharedListBuilder {
        
        return MostSharedListDefaultBuilder()
    }
    
    func mostSharedDetailListDefaultBuilder() -> MostSharedDetailListBuilder {
        
        return MostSharedDetailListDefaultBuilder()
    }
    
    func mostViewedListBuilder() -> MostViewedListBuilder {
        
        return MostViewedListDefaultBuilder()
    }

}
