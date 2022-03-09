//
//  LineupView.swift
//  LineupView
//
//  Created by Ryan Prince on 9/15/21.
//

import SwiftUI

struct LineupView: View {
    
    var lineup: Lineup
    @Binding var showQB: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            PlayerView(logo: lineup.wr1, position: "WR")
                .padding(.top, 36)
                .padding(.trailing, -6)
            PlayerView(logo: lineup.te, position: "TE")
                .padding(.trailing, 6)
            PlayerView(logo: lineup.lt, position: "LT")
            PlayerView(logo: lineup.lg, position: "LG")
            VStack {
                PlayerView(logo: lineup.c, position: "C")
                    .padding(.top, -8)
                if showQB {
                    PlayerView(logo: lineup.qb, position: "QB")
                } else {
                    PlayerView(logo: "", position: "QB")
                }
                PlayerView(logo: lineup.rb, position: "RB")
                    .padding(.top, 4)
            }
            PlayerView(logo: lineup.rg, position: "RG")
            PlayerView(logo: lineup.rt, position: "RT")
            PlayerView(logo: lineup.wr3, position: "WR")
                .padding(.top, 20)
                .padding(.leading, 8)
            PlayerView(logo: lineup.wr2, position: "WR")
        }
        .padding(.top, 24)
        .padding(.bottom, 12)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .background(Color("BackgroundLight"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("SecondaryBlue"), lineWidth: 1))
    }
}
