//
//  NFL.swift
//  NFL
//
//  Created by Ryan Prince on 9/15/21.
//

import Foundation

struct NFL {
    
    static let teams = [Team(id: 1,  location: .arizona,        mascot: .cardinals,     endpoint: "\(Team.base_url)JY5O"),
                        Team(id: 2,  location: .atlanta,        mascot: .falcons,       endpoint: "\(Team.base_url)GV9L"),
                        Team(id: 3,  location: .baltimore,      mascot: .ravens,        endpoint: "\(Team.base_url)45GY"),
                        Team(id: 4,  location: .buffalo,        mascot: .bills,         endpoint: "\(Team.base_url)ID9E"),
                        Team(id: 5,  location: .carolina,       mascot: .panthers,      endpoint: "\(Team.base_url)II5I"),
                        Team(id: 6,  location: .chicago,        mascot: .bears,         endpoint: "\(Team.base_url)OUBN"),
                        Team(id: 7,  location: .cincinnati,     mascot: .bengals,       endpoint: "\(Team.base_url)QD32"),
                        Team(id: 8,  location: .cleveland,      mascot: .browns,        endpoint: "\(Team.base_url)LSBJ"),
                        Team(id: 9,  location: .dallas,         mascot: .cowboys,       endpoint: "\(Team.base_url)9Y96"),
                        Team(id: 10, location: .denver,         mascot: .broncos,       endpoint: "\(Team.base_url)K76L"),
                        Team(id: 11, location: .detroit,        mascot: .lions,         endpoint: "\(Team.base_url)S2G3"),
                        Team(id: 12, location: .green_bay,      mascot: .packers,       endpoint: "\(Team.base_url)SMSJ"),
                        Team(id: 13, location: .houston,        mascot: .texans,        endpoint: "\(Team.base_url)BKZU"),
                        Team(id: 14, location: .indianapolis,   mascot: .colts,         endpoint: "\(Team.base_url)WV0R"),
                        Team(id: 15, location: .jacksonville,   mascot: .jaguars,       endpoint: "\(Team.base_url)2AM1"),
                        Team(id: 16, location: .kansas_city,    mascot: .chiefs,        endpoint: "\(Team.base_url)ZVBC"),
                        Team(id: 17, location: .las_vegas,      mascot: .raiders,       endpoint: "\(Team.base_url)3K3Q"),
                        Team(id: 18, location: .los_angeles,    mascot: .chargers,      endpoint: "\(Team.base_url)9XUI"),
                        Team(id: 19, location: .los_angeles,    mascot: .rams,          endpoint: "\(Team.base_url)2GFU"),
                        Team(id: 20, location: .miami,          mascot: .dolphins,      endpoint: "\(Team.base_url)OAVD"),
                        Team(id: 21, location: .minnesota,      mascot: .vikings,       endpoint: "\(Team.base_url)R2P1"),
                        Team(id: 22, location: .new_england,    mascot: .patriots,      endpoint: "\(Team.base_url)SBVJ"),
                        Team(id: 23, location: .new_orleans,    mascot: .saints,        endpoint: "\(Team.base_url)0FJK"),
                        Team(id: 24, location: .new_york,       mascot: .giants,        endpoint: "\(Team.base_url)8A8I"),
                        Team(id: 25, location: .new_york,       mascot: .jets,          endpoint: "\(Team.base_url)NFIY"),
                        Team(id: 26, location: .philadelphia,   mascot: .eagles,        endpoint: "\(Team.base_url)6F8S"),
                        Team(id: 27, location: .pittsburgh,     mascot: .steelers,      endpoint: "\(Team.base_url)5CB9"),
                        Team(id: 28, location: .san_francisco,  mascot: .forty_niners,  endpoint: "\(Team.base_url)LV4R"),
                        Team(id: 29, location: .seattle,        mascot: .seahawks,      endpoint: "\(Team.base_url)SMGY"),
                        Team(id: 30, location: .tampa_bay,      mascot: .buccaneers,    endpoint: "\(Team.base_url)MZMX"),
                        Team(id: 31, location: .tennessee,      mascot: .titans,        endpoint: "\(Team.base_url)16H2"),
                        Team(id: 32, location: .washington,     mascot: .football_team, endpoint: "\(Team.base_url)IT4V")
        ]
    
    struct Team: Identifiable, Hashable {
        
        let id: Int
        let location: Location
        let mascot: Mascot
        let endpoint: String
        var lineup: Lineup?
        
        static let base_url = "https://jsonkeeper.com/b/"
        
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
            case football_team = "Football Team"
        }
    }
}
