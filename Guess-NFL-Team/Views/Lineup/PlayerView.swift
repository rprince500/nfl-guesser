//
//  PlayerView.swift
//  PlayerView
//
//  Created by Ryan Prince on 9/15/21.
//

import SwiftUI

struct PlayerView: View {
    
    var logo: String
    var position: String
    
    var body: some View {
        VStack {
            Image(logo)
                .resizable()
                .scaledToFit()
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .frame(width: 32, height: 32)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("PrimaryGray"), lineWidth: 2))
            Text(position)
                .font(.caption)
                .padding(.top, -4)
        }
    }
}
