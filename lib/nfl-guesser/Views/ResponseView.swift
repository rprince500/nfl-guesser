//
//  ResponseView.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import SwiftUI

struct ResponseView: View {
    
    var response: Response
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(response.rawValue)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .padding(.bottom, ScreenAdapter.main.size(-16, .height))
            LottieView(filename: "\(response)", animationMode: .once)
                .frame(maxWidth: ScreenAdapter.main.size(300, .width),
                       maxHeight: ScreenAdapter.main.size(300, .width))
                .padding(.bottom, ScreenAdapter.main.size(150, .height))
            Button {
                dismiss()
            } label: {
                Text("Play Again")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .clipShape(Capsule())
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.ultraThinMaterial)
    }
    
    enum Response: String {
        case correct = "Correct!"
        case incorrect = "Wrong!"
    }
}
