
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
    
    public static var name = ""
    
    override func didMove(to view: SKView) {
        print("Start")
    }
    
    func displayName() {
        
    }
    
    func enterName() {
        // Show an alert
        let nameAlert = UIAlertController(title: "Enter Name", message: nil, preferredStyle: .alert)
        let nameAction = UIAlertAction(title: "Okay", style: .default) { (theAlertAction) in
            
            let answer = nameAlert.textFields![0]
            var labelName = self.childNode(withName: "labelName") as? SKLabelNode
            GameSceneStart.name = answer.text ?? ""
            labelName!.text = answer.text ?? ""
        }
        
        // Text Field
        nameAlert.addTextField()
        nameAlert.addAction(nameAction)
        
        // https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-uitextfield-to-a-uialertcontroller
        
        
        self.view!.window!.rootViewController!.present(nameAlert, animated: true, completion: nil)
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch began")
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        print(touchedNode.name)
        
        if touchedNode.name == "buttonName" {
            enterName()
        }
        
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
        
        if touchedNode.name == "buttonMovement" {
            let newScene = GameSceneMovement(fileNamed: "GameSceneMovement")
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            newScene?.scaleMode = .aspectFill
            scene?.view?.presentScene(newScene!, transition: transition)
        }
    }
}
