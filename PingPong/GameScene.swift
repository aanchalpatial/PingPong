//
//  GameScene.swift
//  PingPong
//
//  Created by Aanchal Patial on 19/07/19.
//  Copyright © 2019 AP. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit




class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    
    var player = SKSpriteNode()
    var playerScore = SKLabelNode(fontNamed: "Pixeled")
    
    
    var enemy = SKSpriteNode()
    var enemyScore = SKLabelNode(fontNamed: "Pixeled")
    
    var scores: [Int] = [0, 0]
    var kickingSound = SKAction.playSoundFileNamed("kickSound.mp3", waitForCompletion: false)
    
    var difficultyLevel = 0.6
    var playingMode = "VsComputer"
    
    
    
    override func didMove(to view: SKView) {
        
        
        if let difficulty = self.userData?.value(forKey: "difficulty") as! String?{
            if difficulty == "Easy"{
                difficultyLevel = 0.6
            }else if difficulty == "Medium"{
                difficultyLevel = 0.3
            }else if difficulty == "Hard"{
                difficultyLevel = 0.1
            }
            print(difficultyLevel)
        }
        
        if let playerMode = self.userData?.value(forKey: "playerMode") as! String?{
            playingMode = playerMode
            print(playingMode)
        }
        
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        player = self.childNode(withName: "Player") as! SKSpriteNode
        enemy = self.childNode(withName: "Enemy") as! SKSpriteNode
        
        playerScore.position = CGPoint(x: 0, y: -50)
        playerScore.text = "0"
        playerScore.fontSize = 24
        addChild(playerScore)
        enemyScore.position = CGPoint(x: 0, y: 55)
        enemyScore.text = "0"
        enemyScore.fontSize = 24
        enemyScore.zRotation = CGFloat(Float.pi)
        addChild(enemyScore)
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if playingMode == "OneVsOne"{
                if location.y > 20 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }else if location.y < -20{
                    player.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else if playingMode == "VsComputer"{
                    player.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            
        }
     
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if playingMode == "OneVsOne"{
                if location.y > 20 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }else if location.y < -20{
                    player.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else if playingMode == "VsComputer"{
                player.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
   
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if playingMode == "VsComputer"{
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: difficultyLevel))
        }
        
        
        if ball.position.y < player.position.y - 40.0 {
            roundWon(by: enemy)
        }else if ball.position.y > enemy.position.y + 40.0 {
            roundWon(by: player)
        }

    }
    
    func roundWon(by winner: SKSpriteNode){
        
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if winner.name == "Player"{
            scores[0] += 1
            ball.position = CGPoint(x: 0, y: self.size.height/4)
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
           
        }else if winner.name == "Enemy" {
            scores[1] += 1
            ball.position = CGPoint(x: 0, y: -self.size.height/4)
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        
        playerScore.text = "\(scores[0])"
        enemyScore.text = "\(scores[1])"
        print(playerScore.text! + "-" + enemyScore.text!)
        

        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA.node?.name
        let secondBody = contact.bodyB.node?.name
        
        if firstBody == "Ball"{
            if secondBody == "Player" || secondBody == "Enemy"{
                run(kickingSound)
            }
        }
        
        if firstBody == "Player" || firstBody == "Enemy"{
            if secondBody == "Ball"{
               run(kickingSound)
            }
        }
    }
    
    
}
