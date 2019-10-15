//
//  GameSceneMenu.swift
//  GameExamples
//
//  Created by Matthew Pham on 15/10/19.
//  Copyright © 2019 Matthew Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScenePlatform: SKScene {
    
    var ticks = 0;
    var player: SKSpriteNode?
    var playerSelected = false
    
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "player") as? SKSpriteNode
    }
    
    func addBoulder() {
        var texture = SKTexture(imageNamed: "boulder")
        
        var shape = SKSpriteNode(texture: texture, size: CGSize(width: 20, height: 20)   )
        shape.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        shape.position = CGPoint(x: 250, y: -50)
        
       
        addChild(shape)
        shape.physicsBody!.applyImpulse(CGVector(dx: -4, dy: 0))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        ticks+=1
         if ticks % 200 == 0 {
            addBoulder()
         }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "player" {
            touchedNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy:7))
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerSelected = false
    }
    
    
}
