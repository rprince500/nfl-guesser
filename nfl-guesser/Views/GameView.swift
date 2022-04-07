//
//  GameView.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import SwiftUI

struct GameView: View {
    
    var team: NFL.Team
    
    @State private var showingQB = false
    @State private var selectedTeamID = 1
    @State private var answerSubmitted = false
    
    var body: some View {
        ZStack {
            Color("background-dark").ignoresSafeArea()
            VStack {
                Spacer()
                Text("What team is this?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primary-gray"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                    .padding(.leading, 28)
                    .padding(.bottom, 8)
                LineupView(lineup: team.lineup, showQB: $showingQB)
                    .padding(.bottom, 16)
                HStack {
                    Text("NEED A HINT?")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color("secondary-gray"))
                        .padding(.leading, 28)
                    Toggle(isOn: $showingQB, label: {
                        let text = showingQB ? "Hide QB" : "Reveal QB"
                        Text(text)
                            .font(.caption)
                            .fontWeight(.bold)
                    })
                    .toggleStyle(.button)
                    .tint(Color("primary-blue"))
                    .controlSize(.small)
                    .clipShape(Capsule())
                    .padding(.leading, 8)
                    Spacer()
                }
                Picker("Answer", selection: $selectedTeamID) {
                    ForEach(NFL.teams, id: \.self) { team in
                        Text("\(team.location.rawValue) \(team.mascot.rawValue)")
                            .tag(team.id)
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .accentColor(Color(.systemRed))
                .padding(.top, -10)
                .padding(.leading, 4)
                .padding(.trailing, 4)
                Button() {
                    withAnimation(.easeOut) {
                        self.answerSubmitted.toggle()
                    }
                } label: {
                    HStack(spacing: 24) {
                        Image("\(NFL.teams[selectedTeamID-1].mascot.rawValue.lowercased())")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
                            .frame(width: 40, height: 40)
                            .background(.white)
                            .clipShape(Circle())
                        Text("Submit")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.trailing, 28)
                    }
                    .padding(6)
                }
                .controlSize(.large)
                .background(Color("\(NFL.teams[selectedTeamID-1].mascot.rawValue)-1"))
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color("\(NFL.teams[selectedTeamID-1].mascot.rawValue)-2"), lineWidth: 1))
                .padding(.leading, 14)
                .padding(.trailing, 14)
                .padding(.bottom, 16)
            }
            if answerSubmitted {
                if selectedTeamID == team.id {
                    ResponseView(response: .correct)
                } else {
                    ResponseView(response: .incorrect)
                }
            }
        }
    }
}
