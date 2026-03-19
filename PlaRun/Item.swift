//
//  Item.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 19/03/26.
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
