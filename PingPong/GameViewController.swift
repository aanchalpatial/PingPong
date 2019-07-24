//
//  GameViewController.swift
//  PingPong
//
//  Created by Aanchal Patial on 19/07/19.
//  Copyright © 2019 AP. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var playerMode: String?
    
    @IBAction func singlePlayerButtonPressed(_ sender: UIButton) {
        playerMode = "OneVsOne"
        performSegue(withIdentifier: "goToOneVsOne", sender: self)
    }
    @IBAction func multiPlayerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "difficultyView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneVsOne"{
            let destinationVC = segue.destination as! FinalViewController
            destinationVC.playerMode = playerMode
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //        if let view = self.view as! SKView? {
            //            // Load the SKScene from 'GameScene.sks'
            //            if let scene = SKScene(fileNamed: "GameScene") {
            //                // Set the scale mode to scale to fit the window
            //                scene.scaleMode = .resizeFill
            //
            //                // Present the scene
            //                view.presentScene(scene)
            //            }
            //
            //            view.ignoresSiblingOrder = true
            //            view.showsFPS = true
            //            view.showsNodeCount = true
            //        }
    }

}
