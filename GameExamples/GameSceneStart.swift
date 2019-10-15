
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
    
    override func didMove(to view: SKView) {
        print("Start")
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch began")
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        print(touchedNode.name)
        
        if touchedNode.name == "buttonDrop" {
            let newScene = GameSceneDrop(fileNamed: "GameSceneDrop")
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            newScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(newScene!, transition: transition)
        }
        
        if touchedNode.name == "buttonPlatform" {
            let newScene = GameScenePlatform(fileNamed: "GameScenePlatform")
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            newScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(newScene!, transition: transition)
        }
        
        if touchedNode.name == "buttonRotate" {
            let newScene = GameSceneRotate(fileNamed: "GameSceneRotate")
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            newScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(newScene!, transition: transition)
        }
        
        if touchedNode.name == "buttonBounce" {
            let newScene = GameSceneBounce(fileNamed: "GameSceneBounce")
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            newScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(newScene!, transition: transition)
        }
    }
}
