//
//  Animatable.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//

import SpriteKit

protocol Animatable: class {
    
    var animations: [SKAction] { get set }
    
}

//enum Direction: Int {
//    case right = 0, left, up, down
//}

extension Animatable {
    func animationDirection(for directionVector: CGVector) -> Direction {
        let direction: Direction
        if abs(directionVector.dy) > abs(directionVector.dx) {
            direction = directionVector.dy < 0 ? .left : .right
        } else {
            direction = directionVector.dx < 0 ? .left : .right
        }
        return direction
    }
    
    func createAnimations(character: String) {
        let actionRight: SKAction = SKAction.animate(with: [
            SKTexture(pixelImageNamed: "player1"),
            SKTexture(pixelImageNamed: "player2")
            ], timePerFrame: 0.1)
        animations.append(SKAction.repeatForever(actionRight))
        animations.append(SKAction.repeatForever(actionRight))
        animations.append(SKAction.repeatForever(actionRight))
        animations.append(SKAction.repeatForever(actionRight))
    }
}
