//
//  GameScene.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, ButtonDelegate{
    var maze: SKTileMapNode!
    var player: Player!
    var rightButton: ButtonNode!
    var leftButton: ButtonNode!
    var upButton: ButtonNode!
    var downButton: ButtonNode!
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        maze = childNode(withName: "maze") as! SKTileMapNode
    }
    
    override func didMove(to view: SKView) {

        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
                if let buttonNode = eventListenerNode as? ButtonNode {
                    buttonNode.delegate = self
                }

            }
        })
        
        player = childNode(withName: "player") as! Player
        rightButton = childNode(withName: "right") as! ButtonNode
        rightButton.setUpDirection(direction: .right)
        leftButton = childNode(withName: "left") as! ButtonNode
        leftButton.setUpDirection(direction: .left)
        upButton = childNode(withName: "up") as! ButtonNode
        upButton.setUpDirection(direction: .up)
        downButton = childNode(withName: "down") as! ButtonNode
        downButton.setUpDirection(direction: .down)
        
        setupMazePhysics()
        
        let circle = SKShapeNode(circleOfRadius: player.size.width/2)
        circle.fillColor = .blue
        circle.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width/2)
        circle.physicsBody?.affectedByGravity = true
        circle.position = player.position
        circle.physicsBody?.friction = 1.0
        addChild(circle)
        
    }
    
    func onButtonTap(sender: ButtonNode) {
            print("delegate worked")
            player.direction = sender.direction
            player.move()
    }

    func setupMazePhysics() {
        guard let maze = maze else { return }
        // 1
        var physicsBodies = [SKPhysicsBody]()
        // 2
        for row in 0..<maze.numberOfRows {
            for column in 0..<maze.numberOfColumns {
                guard let tile = tile(in: maze,
                                      at: (column, row))
                    else { continue }
                // 3
                let center = maze
                    .centerOfTile(atColumn: column, row: row)
                let body = SKPhysicsBody(rectangleOf: tile.size,
                                                  center: center)
                physicsBodies.append(body)
            }
        }
        // 4
        maze.physicsBody =
            SKPhysicsBody(bodies: physicsBodies)
        maze.physicsBody?.isDynamic = false
        maze.physicsBody?.friction = 0
    }
    
    func setupWorldPhysics() {
//        physicsWorld.contactDelegate = self
    }
    
    // MARK:- Helper methods
    func tile(in tileMap: SKTileMapNode,
              at coordinates: TileCoordinates)
        -> SKTileDefinition? {
            return tileMap.tileDefinition(atColumn: coordinates.column,
                                          row: coordinates.row)
    }
    
    func tileCoordinates(in tileMap: SKTileMapNode,
                         at position: CGPoint) -> TileCoordinates {
        let column = tileMap.tileColumnIndex(fromPosition: position)
        let row = tileMap.tileRowIndex(fromPosition: position)
        return (column, row)
    }
    
    func tileGroupForName(tileSet: SKTileSet, name: String)
        -> SKTileGroup? {
            let tileGroup = tileSet.tileGroups
                .filter { $0.name == name }.first
            return tileGroup
    }
}



