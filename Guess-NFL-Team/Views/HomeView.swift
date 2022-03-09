//
//  HomeView.swift
//  HomeView
//
//  Created by Ryan Prince on 9/15/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var gameStarted = false
    @StateObject private var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            VStack() {
                Spacer()
                LottieView(filename: "nfl", animationMode: .looping)
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                    .shadow(color: Color("Shadow"), radius: 8)
                    .shadow(color: Color("Shadow"), radius: 8)
                    .shadow(color: Color("Shadow"), radius: 8)
                Text("Guess That NFL Team")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("PrimaryBlue"))
                    .padding(.top, 30)
                Spacer()
                Button() {
                    let teamID = Int.random(in: 1...32)
                    let team = NFL.teams.first(where: { $0.id == teamID }) ?? NFL.teams[0]
                    Task.init {
                        try? await networkManager.fetchLineup(for: team)
                    }
                    gameStarted.toggle()
                } label: {
                    Text("Let's Play")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .clipShape(Capsule())
                .sheet(isPresented: $gameStarted) {
                    GameView(lineup: networkManager.lineup)
                }
                .padding(.bottom, 16)
            }
        }
    }
}
