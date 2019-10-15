//
//  GameScene.swift
//  GameExamples
//
//  Created by Matthew Pham on 1/10/19.
//  Copyright © 2019 Matthew Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameSceneDrop: SKScene {
    var player:SKSpriteNode?
    var ticks = 0
    var playerSelected = false
    var cameraNode:SKCameraNode?
    var drop:SKSpriteNode?
    
    // Jumping from bottom
    // https://stackoverflow.com/questions/44913398/trying-to-make-platforms-that-i-can-jump-through-from-underneath-but-land-on-top
    
    override func didMove(to view: SKView) {
        print("Rice")
        player = childNode(withName: "player") as? SKSpriteNode
        cameraNode = childNode(withName: "camera") as? SKCameraNode
        drop = childNode(withName: "buttonBK") as? SKSpriteNode
        camera = cameraNode
    }
    
    func addShape() {
        var shapePoints = [CGPoint(x:0, y:1), CGPoint(x:5,y:0), CGPoint(x:10,y:-5), CGPoint(x:-10,y:-5),
                           CGPoint(x:-5,y:0), CGPoint(x:0,y:1)]
        let shape = SKShapeNode(points: &shapePoints, count: shapePoints.count)
        shape.fillColor = SKColor.white
        
        let path = CGMutablePath()
        path.addLines(between: shapePoints)
        path.closeSubpath()
        shape.physicsBody = SKPhysicsBody(polygonFrom: path)
        
        shape.position = CGPoint(x:player!.position.x,y:20)
        addChild(shape)
    }
    
    func addRock() {
        let rockTexture = SKTexture(imageNamed: "balloon")
        let rockSize = CGSize(width:6.85, height:8.0)
        let rock = SKSpriteNode(texture: rockTexture, size: rockSize)
        rock.physicsBody = SKPhysicsBody(texture: rockTexture,
                                         size: rockSize)
        
        addChild(rock)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "buttonBK" || touchedNode.name == "buttonText" {
            addShape()
        }
        
        if touchedNode.name == "player" {
            playerSelected = true
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let previousTouchLocation = touch.previousLocation(in: self)
        
        if playerSelected {
            let playerX = player!.position.x + (touchLocation.x - previousTouchLocation.x)
            let cameraX = cameraNode!.position.x + (touchLocation.x - previousTouchLocation.x)
            let dropX = drop!.position.x + (touchLocation.x - previousTouchLocation.x)
            player!.position = CGPoint(x: playerX, y: player!.position.y)
            cameraNode!.position = CGPoint(x: cameraX, y:cameraNode!.position.y)
            drop!.position = CGPoint(x: dropX, y:drop!.position.y)
        }
                    
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerSelected = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        ticks+=1
        
        
         if ticks > 30 {
         ticks = 0;
         //addRock()
         addShape()
         
         }
         
        
        
    }
}

