//
//  GameView.swift
//  GameView
//
//  Created by Ryan Prince on 9/15/21.
//

import SwiftUI

struct GameView: View {
    
    var lineup: Lineup
    
    @State private var showingQB = false
    @State private var selectedTeam = 1
    @State private var answerSubmitted = false
    
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            VStack {
                Spacer()
                Text("What team is this?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryGray"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                    .padding(.leading, 28)
                    .padding(.bottom, 8)
                LineupView(lineup: lineup, showQB: $showingQB)
                    .padding(.bottom, 16)
                HStack {
                    Text("NEED A HINT?")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color("SecondaryGray"))
                        .padding(.leading, 28)
                    Toggle(isOn: $showingQB, label: {
                        let text = showingQB ? "Hide QB" : "Reveal QB"
                        Text(text)
                            .font(.caption)
                            .fontWeight(.bold)
                    })
                    .toggleStyle(.button)
                    .tint(Color("PrimaryBlue"))
                    .controlSize(.small)
                    .clipShape(Capsule())
                    .padding(.leading, 8)
                    Spacer()
                }
                Picker("Answer", selection: $selectedTeam) {
                    ForEach(NFL.teams, id: \.self) { team in
                        Text("\(team.location.rawValue) \(team.mascot.rawValue)")
                            .tag(team.id)
                    }
                }
                .pickerStyle(.wheel)
                .padding(.top, -10)
                .padding(.leading, 4)
                .padding(.trailing, 4)
                Button() {
                    withAnimation(.easeOut) {
                        self.answerSubmitted.toggle()
                    }
                } label: {
                    HStack(spacing: 24) {
                        Image("\(NFL.teams[selectedTeam-1].mascot.rawValue)")
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
                .background(Color("\(NFL.teams[selectedTeam-1].mascot.rawValue)-1"))
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color("\(NFL.teams[selectedTeam-1].mascot.rawValue)-2"), lineWidth: 1))
                .padding(.leading, 14)
                .padding(.trailing, 14)
                .padding(.bottom, 16)
            }
            if answerSubmitted {
                if selectedTeam == lineup.id {
                    ResponseView(response: .correct)
                } else {
                    ResponseView(response: .incorrect)
                }
            }
        }
    }
}
