//
//  Protocols.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//

import SpriteKit

protocol EventListenerNode {
    func didMoveToScene()
}

protocol InteractiveNode {
    func interact()
}


protocol ButtonDelegate: class {
    func onButtonTap(sender: ButtonNode)
}
