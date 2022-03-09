//
//  ResponseView.swift
//  ResponseView
//
//  Created by Ryan Prince on 9/24/21.
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
                .foregroundColor(response == .correct ? Color("\(Response.correct)") : Color("\(Response.incorrect)"))
                .padding(.bottom, 20)
            LottieView(filename: "\(response)", animationMode: .once)
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.bottom, 150)
            Button {
                dismiss()
            } label: {
                Text("Play Again")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
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
