//
//  Item.swift
//  lp1_2_0
//
//  Created by Lewis Campbell on 10/21/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
