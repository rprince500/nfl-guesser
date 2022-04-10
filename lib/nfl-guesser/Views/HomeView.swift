//
//  HomeView.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import SwiftUI
import Lottie

struct HomeView: View {
    
    @State private var gameStarted = false
    @StateObject private var lineupDao = LineupDAO()
    
    var body: some View {
        ZStack {
            Color("background-dark").ignoresSafeArea()
            VStack() {
                Spacer()
                LottieView(filename: "nfl", animationMode: .looping)
                    .frame(minWidth: 0,
                           maxWidth: ScreenAdapter.main.size(200, .width),
                           minHeight: 0,
                           maxHeight: ScreenAdapter.main.size(200, .width))
                    .shadow(color: Color("shadow"), radius: 8)
                    .shadow(color: Color("shadow"), radius: 8)
                    .shadow(color: Color("shadow"), radius: 8)
                Text("Guess That NFL Team")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("primary-blue"))
                    .padding(.top, ScreenAdapter.main.size(30, .height))
                Spacer()
                Button() {
                    let teamID = Int.random(in: 1...32)
                    let team = NFL.teams.first(where: { $0.id == teamID }) ?? NFL.teams[0]
                    Task {
                        await lineupDao.fetchLineup(of: team)
                        gameStarted.toggle()
                    }
                    
                } label: {
                    Text("Let's Play")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .clipShape(Capsule())
                .sheet(isPresented: $gameStarted) {
                    GameView(team: lineupDao.team ?? NFL.teams[0])
                }
                .padding(.bottom, 16)
            }
        }
    }
}
