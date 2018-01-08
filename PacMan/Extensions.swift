//
//  Extensions.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//


import SpriteKit

extension SKTexture {
    convenience init(pixelImageNamed: String) {
        self.init(imageNamed: pixelImageNamed)
        self.filteringMode = .nearest
    }
}


