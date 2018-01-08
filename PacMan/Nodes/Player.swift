//
//  Player.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//

import Foundation
import SpriteKit

enum PlayerState: Int {
    case chomping = 0, still
}

enum PlayerSettings {
    static let playerSpeed: CGFloat = 100.0
}

class Player: SKSpriteNode, Animatable, EventListenerNode {
    
    var direction: Direction?
    
    var animations: [SKAction] = []
    
    var state: PlayerState = .still
    
    init() {
        let texture = SKTexture(pixelImageNamed: "player1")
        super.init(texture: texture, color: .clear,
                   size: texture.size())
        zPosition = 50
        physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        
//        physicsBody?.categoryBitMask = PhysicsCategory.Player
//        physicsBody?.contactTestBitMask = PhysicsCategory.All
        
        createAnimations(character: "player")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        
        physicsBody?.categoryBitMask = PhysicsCategory.Player
        physicsBody?.contactTestBitMask = PhysicsCategory.All
        physicsBody?.affectedByGravity = true
        
        createAnimations(character: "player")
    }
    
    func didMoveToScene() {
        
    }
    
    
    func move() {
        while state != .still {
            let newPosition = CGPoint(x: position.x + 10, y: position.y
            run(SKAction.repeatForever(SKAction.move(to: newPosition, duration: 1)))
        }
    }
//
//    func move(){
//        guard let physicsBody = physicsBody else { return }
//
//        var target: CGPoint
//        switch direction
//        {
//        case .right?:
//            target = CGPoint(x: position.x + 10, y: position.y)
//        case .left?:
//            target = CGPoint(x: position.x - 10, y: position.y)
//        case .up?:
//            target = CGPoint(x: position.x, y: position.y + 10)
//        case .down?:
//            target = CGPoint(x:position.y, y: position.y - 10)
//        default:
//            target = CGPoint(x: position.y, y: 0)
//        }
//        let newVelocity = (target - position).normalized() * PlayerSettings.playerSpeed
//        physicsBody.velocity = CGVector(point: newVelocity)
//        checkDirection()
//        run(SKAction.move(to: target, duration: 0.2))
//    }
    
    func checkDirection() {
        guard let physicsBody = physicsBody, let direction = direction else { return }
        rotateToVelocity((self.physicsBody?.velocity)!, rate: 1.0)
        
        run(animations[(self.direction?.rawValue)!], withKey: "animation")
    }
    
}
