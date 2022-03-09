//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Ryan Prince on 9/16/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var lineup = Lineup(id: 0, qb: "", rb: "", wr1: "", wr2: "", wr3: "", te: "", lt: "", lg: "", c: "", rg: "", rt: "")
    
    @MainActor
    func fetchLineup(for team: NFL.Team) async throws {
        do {
            let lineup = try await load(url: team.endpoint)
            self.lineup = lineup
        }
        catch let error {
            handleError(error)
        }
    }

    private func load(url: String) async throws -> Lineup {
        guard let url = URL(string: url) else { throw DownloadError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw DownloadError.statusNotOk
        }
        guard let decodedResponse = try? JSONDecoder().decode(Lineup.self, from: data) else { throw DownloadError.decoderError }
        return decodedResponse
    }
    
    private func handleError(_ error: Error) {
        switch error {
        case DownloadError.invalidURL:
            print("Invalid URL")
        case DownloadError.statusNotOk:
            print("Error downloading from server")
        case DownloadError.decoderError:
            print("Error decoding JSON")
        default:
            print("Error: \(error)")
        }
    }
    
    private enum DownloadError: Error {
        case invalidURL
        case statusNotOk
        case decoderError
    }
    
    public init() { }
}
