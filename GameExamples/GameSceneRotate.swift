//
//  GameSceneRotate.swift
//  GameExamples
//
//  Created by Matthew Pham on 15/10/19.
//  Copyright © 2019 Matthew Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameSceneRotate: SKScene {
    override func didMove(to view: SKView) {
        let anchor = SKNode()
        
        anchor.position = CGPoint(x: 0,
                                  y: 0)
        anchor.physicsBody = SKPhysicsBody()
        anchor.physicsBody?.isDynamic = false
        anchor.name = "anchor"
        
        let triangle = createShape()
        triangle.name = "triangle"
        triangle.physicsBody?.affectedByGravity = true
        triangle.zRotation = CGFloat.pi / 2
        
        addChild(anchor)
        anchor.addChild(triangle)
        
        
        let pinJoint = SKPhysicsJointPin.joint(withBodyA: anchor.physicsBody!, bodyB: triangle.physicsBody!, anchor: anchor.position)
        
        physicsWorld.add(pinJoint)
        
        
    }
    
    func createShape() -> SKShapeNode {
        var shapePoints = [CGPoint(x:0, y:0), CGPoint(x:3,y:-40), CGPoint(x:-3,y:-40), CGPoint(x:0,y:0)]
        let shape = SKShapeNode(points: &shapePoints, count: shapePoints.count)
        shape.fillColor = SKColor.white
        
        let path = CGMutablePath()
        path.addLines(between: shapePoints)
        path.closeSubpath()
        shape.physicsBody = SKPhysicsBody(polygonFrom: path)
        
        return shape
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let anchor = childNode(withName: "anchor") as? SKNode
        let triangle = anchor?.childNode(withName: "triangle") as? SKShapeNode
        triangle?.physicsBody?.applyImpulse(CGVector(dx: 1, dy: 0))
        
    }
}
