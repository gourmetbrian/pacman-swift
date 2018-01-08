//
//  Types.swift
//  PacMan
//
//  Created by Brian Lane on 1/7/18.
//  Copyright © 2018 Brian Lane. All rights reserved.
//

enum Direction: Int {
    case up = 0, right, down, left
}

typealias TileCoordinates = (column: Int, row: Int)

struct PhysicsCategory {
    static let None:      UInt32 = 0
    static let All:       UInt32 = 0xFFFFFFFF
    static let Edge:      UInt32 = 0b1
    static let Player:    UInt32 = 0b10
    static let Bug:       UInt32 = 0b100
    static let Firebug:   UInt32 = 0b1000
    static let Breakable: UInt32 = 0b10000
}

