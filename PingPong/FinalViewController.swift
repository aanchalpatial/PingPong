//
//  FinalViewController.swift
//  PingPong
//
//  Created by Aanchal Patial on 24/07/19.
//  Copyright © 2019 AP. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class FinalViewController: UIViewController {
    
    
    var difficultyLevel: String?
    var playerMode: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if let view = self.view as! SKView? {
            
            if let gameScene = SKScene(fileNamed: "GameScene") {
                
                let transition = SKTransition.reveal(with: SKTransitionDirection.down, duration: 0) // create type of transition (you can check in documentation for more transtions)
                gameScene.scaleMode = SKSceneScaleMode.resizeFill
                gameScene.userData = NSMutableDictionary()
                gameScene.userData?.setObject(difficultyLevel ?? "Easy", forKey: "difficulty" as NSCopying)
                gameScene.userData?.setObject(playerMode ?? "VsComputer", forKey: "playerMode" as NSCopying)
                view.presentScene(gameScene, transition: transition)
            }
            
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
