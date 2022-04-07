//
//  NFL.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import Foundation

struct NFL {
    
    static let teams = [Team(id: 1,  location: .arizona,        mascot: .cardinals,     lineup: Lineup()),
                        Team(id: 2,  location: .atlanta,        mascot: .falcons,       lineup: Lineup()),
                        Team(id: 3,  location: .baltimore,      mascot: .ravens,        lineup: Lineup()),
                        Team(id: 4,  location: .buffalo,        mascot: .bills,         lineup: Lineup()),
                        Team(id: 5,  location: .carolina,       mascot: .panthers,      lineup: Lineup()),
                        Team(id: 6,  location: .chicago,        mascot: .bears,         lineup: Lineup()),
                        Team(id: 7,  location: .cincinnati,     mascot: .bengals,       lineup: Lineup()),
                        Team(id: 8,  location: .cleveland,      mascot: .browns,        lineup: Lineup()),
                        Team(id: 9,  location: .dallas,         mascot: .cowboys,       lineup: Lineup()),
                        Team(id: 10, location: .denver,         mascot: .broncos,       lineup: Lineup()),
                        Team(id: 11, location: .detroit,        mascot: .lions,         lineup: Lineup()),
                        Team(id: 12, location: .green_bay,      mascot: .packers,       lineup: Lineup()),
                        Team(id: 13, location: .houston,        mascot: .texans,        lineup: Lineup()),
                        Team(id: 14, location: .indianapolis,   mascot: .colts,         lineup: Lineup()),
                        Team(id: 15, location: .jacksonville,   mascot: .jaguars,       lineup: Lineup()),
                        Team(id: 16, location: .kansas_city,    mascot: .chiefs,        lineup: Lineup()),
                        Team(id: 17, location: .las_vegas,      mascot: .raiders,       lineup: Lineup()),
                        Team(id: 18, location: .los_angeles,    mascot: .chargers,      lineup: Lineup()),
                        Team(id: 19, location: .los_angeles,    mascot: .rams,          lineup: Lineup()),
                        Team(id: 20, location: .miami,          mascot: .dolphins,      lineup: Lineup()),
                        Team(id: 21, location: .minnesota,      mascot: .vikings,       lineup: Lineup()),
                        Team(id: 22, location: .new_england,    mascot: .patriots,      lineup: Lineup()),
                        Team(id: 23, location: .new_orleans,    mascot: .saints,        lineup: Lineup()),
                        Team(id: 24, location: .new_york,       mascot: .giants,        lineup: Lineup()),
                        Team(id: 25, location: .new_york,       mascot: .jets,          lineup: Lineup()),
                        Team(id: 26, location: .philadelphia,   mascot: .eagles,        lineup: Lineup()),
                        Team(id: 27, location: .pittsburgh,     mascot: .steelers,      lineup: Lineup()),
                        Team(id: 28, location: .san_francisco,  mascot: .forty_niners,  lineup: Lineup()),
                        Team(id: 29, location: .seattle,        mascot: .seahawks,      lineup: Lineup()),
                        Team(id: 30, location: .tampa_bay,      mascot: .buccaneers,    lineup: Lineup()),
                        Team(id: 31, location: .tennessee,      mascot: .titans,        lineup: Lineup()),
                        Team(id: 32, location: .washington,     mascot: .commanders,    lineup: Lineup())
        ]
    
    struct Team: Identifiable, Hashable {
        
        let id: Int
        let location: Location
        let mascot: Mascot
        var lineup: Lineup
        
        enum Location: String {
            case arizona = "Arizona"
            case atlanta = "Atlanta"
            case baltimore = "Baltimore"
            case buffalo = "Buffalo"
            case carolina = "Carolina"
            case chicago = "Chicago"
            case cincinnati = "Cincinnati"
            case cleveland = "Cleveland"
            case dallas = "Dallas"
            case denver = "Denver"
            case detroit = "Detroit"
            case green_bay = "Green Bay"
            case houston = "Houston"
            case indianapolis = "Indianapolis"
            case jacksonville = "Jacksonville"
            case kansas_city = "Kansas City"
            case las_vegas = "Las Vegas"
            case los_angeles = "Los Angeles"
            case miami = "Miami"
            case minnesota = "Minnesota"
            case new_england = "New England"
            case new_orleans = "New Orleans"
            case new_york = "New York"
            case philadelphia = "Philadelphia"
            case pittsburgh = "Pittsburgh"
            case san_francisco = "San Francisco"
            case seattle = "Seattle"
            case tampa_bay = "Tampa Bay"
            case tennessee = "Tennessee"
            case washington = "Washington"
        }
        
        enum Mascot: String {
            case cardinals = "Cardinals"
            case falcons = "Falcons"
            case ravens = "Ravens"
            case bills = "Bills"
            case panthers = "Panthers"
            case bears = "Bears"
            case bengals = "Bengals"
            case browns = "Browns"
            case cowboys = "Cowboys"
            case broncos = "Broncos"
            case lions = "Lions"
            case packers = "Packers"
            case texans = "Texans"
            case colts = "Colts"
            case jaguars = "Jaguars"
            case chiefs = "Chiefs"
            case chargers = "Chargers"
            case rams = "Rams"
            case dolphins = "Dolphins"
            case vikings = "Vikings"
            case patriots = "Patriots"
            case saints = "Saints"
            case giants = "Giants"
            case jets = "Jets"
            case raiders = "Raiders"
            case eagles = "Eagles"
            case steelers = "Steelers"
            case forty_niners = "49ers"
            case seahawks = "Seahawks"
            case buccaneers = "Buccaneers"
            case titans = "Titans"
            case commanders = "Commanders"
        }
    }
}
