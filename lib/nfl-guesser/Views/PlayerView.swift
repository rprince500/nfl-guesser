//
//  PlayerView.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import SwiftUI

struct PlayerView: View {
    
    var position: String
    var college: String
    
    @StateObject private var logoDao = LogoDAO()
    
    var body: some View {
        VStack {
            Image(uiImage: logoDao.logo ?? UIImage())
                .resizable()
                .scaledToFit()
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .frame(width: ScreenAdapter.main.size(32, .width),
                       height: ScreenAdapter.main.size(32, .width))
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("primary-blue"), lineWidth: 2))
            Text(position)
                .font(.caption)
                .foregroundColor(Color("text-light-gray"))
                .padding(.top, ScreenAdapter.main.size(-4, .height))
        }
        .onAppear() {
            logoDao.fetchLogo(of: college)
        }
    }
}
