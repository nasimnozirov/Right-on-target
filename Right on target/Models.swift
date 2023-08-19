//
//  Models.swift
//  Right on target
//
//  Created by Nasim Nozirov on 13.08.2023.
//

import Foundation

struct GameAttributes {
    var number: Int
    var round: Int
    var point: Int
    
    static func getNumber() -> GameAttributes {
        GameAttributes(number: 0, round: 0, point: 0)
    }
}
