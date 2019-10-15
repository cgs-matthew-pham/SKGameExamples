//
//  GameScene.swift
//  GameExamples
//
//  Created by Matthew Pham on 1/10/19.
//  Copyright © 2019 Matthew Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameSceneStart: SKScene {

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch began")
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        print(touchedNode.name)
        
        if touchedNode.name == "buttonRice" || touchedNode.name == "buttonRiceText" {
            print("Button Clicked")
            let sceneRice = GameScene(fileNamed: "GameScene1")
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            sceneRice?.scaleMode = .aspectFill
            scene?.view?.presentScene(sceneRice!, transition: transition)
        }
    }
}
