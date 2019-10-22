//
//  GameSceneMovement.swift
//  GameExamples
//
//  Created by Matthew Pham on 22/10/19.
//  Copyright © 2019 Matthew Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameSceneMovement: SKScene {
    
    var player: SKSpriteNode?
    var fingerOnLeft: Bool = false
    var fingerOnRight: Bool = false
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "player") as! SKSpriteNode
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        print(touchedNode.name)
        
        if touchedNode.name == "right" {
            fingerOnRight = true
        }
        
        if touchedNode.name == "left" {
            fingerOnLeft = true
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        fingerOnRight = false
        fingerOnLeft = false
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if fingerOnRight == true {
            player!.position = CGPoint(x: player!.position.x + 1 , y: player!.position.y)
        }
    }
}
