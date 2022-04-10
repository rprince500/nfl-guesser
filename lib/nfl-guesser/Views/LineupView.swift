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
                .padding(.top, ScreenAdapter.main.size(36, .height))
                .padding(.trailing, ScreenAdapter.main.size(-6, .width))
            PlayerView(position: "TE", college: lineup.te)
                .padding(.trailing, ScreenAdapter.main.size(6, .width))
            PlayerView(position: "LT", college: lineup.lt)
            PlayerView(position: "LG", college: lineup.lg)
            VStack {
                PlayerView(position: "C", college: lineup.c)
                    .padding(.top, ScreenAdapter.main.size(-8, .height))
                if showQB {
                    PlayerView(position: "QB", college: lineup.qb)
                } else {
                    PlayerView(position: "QB", college: "")
                }
                PlayerView(position: "RB", college: lineup.rb)
                    .padding(.top, ScreenAdapter.main.size(4, .height))
            }
            PlayerView(position: "RG", college: lineup.rg)
            PlayerView(position: "RT", college: lineup.rt)
            PlayerView(position: "WR", college: lineup.wr3)
                .padding(.top, ScreenAdapter.main.size(20, .height))
                .padding(.leading, ScreenAdapter.main.size(8, .width))
            PlayerView(position: "WR", college: lineup.wr2)
        }
        .padding(.top, ScreenAdapter.main.size(24, .height))
        .padding(.bottom, ScreenAdapter.main.size(12, .height))
        .padding(.leading, ScreenAdapter.main.size(16, .width))
        .padding(.trailing, ScreenAdapter.main.size(16, .width))
        .background(Color("background-light"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("secondary-blue"), lineWidth: 1))
    }
}
