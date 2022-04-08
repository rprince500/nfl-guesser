//
//  ScreenAdapter.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 4/7/22.
//

import UIKit

class ScreenAdapter {
    
    static let main = ScreenAdapter()
    
    private let testDeviceWidth: CGFloat = 390
    private let testDeviceHeight: CGFloat = 844
    
    func size(_ size: CGFloat, _ orientation: Orientation) -> CGFloat {
        switch orientation {
        case .width:
            return size*(UIScreen.main.bounds.size.width/testDeviceWidth)
        case .height:
            return size*(UIScreen.main.bounds.size.height/testDeviceHeight)
        }
    }
    
    enum Orientation {
        case width
        case height
    }
    
    private init() { }
}
