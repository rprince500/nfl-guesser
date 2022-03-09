//
//  Lineup.swift
//  Lineup
//
//  Created by Ryan Prince on 9/15/21.
//

import Foundation

struct Lineup: Identifiable, Hashable, Codable {
    
    var id: Int
    var qb: String
    var rb: String
    var wr1: String
    var wr2: String
    var wr3: String
    var te: String
    var lt: String
    var lg: String
    var c: String
    var rg: String
    var rt: String
}
