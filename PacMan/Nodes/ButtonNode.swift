//
//  ButtonNode.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//

import SpriteKit

class ButtonNode: SKSpriteNode, InteractiveNode, EventListenerNode {
    
    var direction: Direction?
    weak var delegate: ButtonDelegate?
    
//    init(withImageNamed: String, andDirection: Direction) {
//        let texture = SKTexture(pixelImageNamed: withImageNamed)
//        super.init(texture: texture, color: .clear, size: texture.size())
//        buttonName = withImageNamed
//        direction = andDirection
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    func setUpDirection(direction: Direction) {
        self.direction = direction
    }
    
    func interact() {
        onButtonTap(sender: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("I was touched")
        interact()
    }
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        print("I was added to scene")
    }
    
    func onButtonTap(sender: ButtonNode) {
        delegate?.onButtonTap(sender: self)
    }
    
}
