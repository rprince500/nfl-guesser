//
//  LottieView.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    
    var filename: String
    var animationMode: AnimationMode
    
    let animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        if animationMode == .looping {
            animationView.loopMode = .loop
            animationView.backgroundBehavior = .pauseAndRestore
        }
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
    
    enum AnimationMode {
        case once
        case looping
    }
}
