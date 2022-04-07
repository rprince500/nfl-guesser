//
//  LineupView.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import Lottie
import SwiftUI

struct LineupView: View {
    
    var lineup: Lineup
    
    @Binding var showQB: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            PlayerView(position: "WR", college: lineup.wr1)
                .padding(.top, 36)
                .padding(.trailing, -6)
            PlayerView(position: "TE", college: lineup.te)
                .padding(.trailing, 6)
            PlayerView(position: "LT", college: lineup.lt)
            PlayerView(position: "LG", college: lineup.lg)
            VStack {
                PlayerView(position: "C", college: lineup.c)
                    .padding(.top, -8)
                if showQB {
                    PlayerView(position: "QB", college: lineup.qb)
                } else {
                    PlayerView(position: "QB", college: "")
                }
                PlayerView(position: "RB", college: lineup.rb)
                    .padding(.top, 4)
            }
            PlayerView(position: "RG", college: lineup.rg)
            PlayerView(position: "RT", college: lineup.rt)
            PlayerView(position: "WR", college: lineup.wr3)
                .padding(.top, 20)
                .padding(.leading, 8)
            PlayerView(position: "WR", college: lineup.wr2)
        }
        .padding(.top, 24)
        .padding(.bottom, 12)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .background(Color("background-light"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("secondary-blue"), lineWidth: 1))
    }
}
