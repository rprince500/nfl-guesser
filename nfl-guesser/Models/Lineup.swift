//
//  Lineup.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import Foundation

struct Lineup: Hashable, Codable {
    
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

extension Lineup {
    
    init() {
        qb = "none"
        rb = "none"
        wr1 = "none"
        wr2 = "none"
        wr3 = "none"
        te = "none"
        lt = "none"
        lg = "none"
        c = "none"
        rg = "none"
        rt = "none"
    }
}
