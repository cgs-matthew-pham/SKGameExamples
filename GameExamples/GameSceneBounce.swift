//
//  GameSceneBounce.swift
//  GameExamples
//
//  Created by Matthew Pham on 15/10/19.
//  Copyright © 2019 Matthew Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameSceneBounce: SKScene {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
}
