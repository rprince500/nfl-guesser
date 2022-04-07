//
//  LineupDAO.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 4/3/22.
//

import AWSS3
import Foundation

@MainActor class LineupDAO: ObservableObject {
    
    @Published var team: NFL.Team?
    
    func fetchLineup(of team: NFL.Team) async {
        return await withCheckedContinuation{ continuation in
            load(team) { lineup in
                DispatchQueue.main.async {
                    self.team = NFL.Team(id: team.id,
                                         location: team.location,
                                         mascot: team.mascot,
                                         lineup: lineup)
                    continuation.resume()
                }
            }
        }
    }
    
//    func fetchLineup(of team: NFL.Team, completion: @escaping () -> Void) {
//        load(team) { lineup in
//            DispatchQueue.main.async {
//                self.team = NFL.Team(id: team.id,
//                                     location: team.location,
//                                     mascot: team.mascot,
//                                     lineup: lineup)
//                completion()
//            }
//        }
//    }
    
    private func load(_ team: NFL.Team, completion: @escaping (Lineup) -> Void) {
        let expression = AWSS3TransferUtilityDownloadExpression()
            expression.progressBlock = {(task, progress) in DispatchQueue.main.async {
                // Do something e.g. Update a progress bar.
            }
        }

        var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?
        completionHandler = { (task, URL, data, error) -> Void in
            DispatchQueue.main.async {
                guard let data = data else { return }
                let lineup = try! JSONDecoder().decode(Lineup.self, from: data)
                completion(lineup)
            }
        }

        let transferUtility = AWSS3TransferUtility.default()
        transferUtility.downloadData(
            fromBucket: "nfl-guesser",
            key: "lineups/\(team.mascot.rawValue.lowercased()).json",
            expression: expression,
            completionHandler: completionHandler
            ).continueWith {
                (task) -> AnyObject? in if let error = task.error {
                    print("Error: \(error.localizedDescription)")
                }

                if let _ = task.result {
                    // Do something with downloadTask.
                }
                return nil;
            }
    }
    
    public init() { }
}
