//
//  DifficultyViewController.swift
//  PingPong
//
//  Created by Aanchal Patial on 23/07/19.
//  Copyright © 2019 AP. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class DifficultyViewController: UIViewController {
    
    
    
    @IBOutlet weak var easySwitch: UISwitch!
    
    @IBOutlet weak var mediumSwitch: UISwitch!
    
    @IBOutlet weak var hardSwitch: UISwitch!
    
    
    var difficultyButtonPressed: String? = "Easy"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        easySwitch.addTarget(self, action: #selector(easySwitchChanged), for: .valueChanged)
        mediumSwitch.addTarget(self, action: #selector(mediumSwitchChanged), for: .valueChanged)
        hardSwitch.addTarget(self, action: #selector(hardSwitchChanged), for: .valueChanged)

    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "goToVsComputer", sender: self)
  
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVsComputer"{
            let destinationVC = segue.destination as! FinalViewController
            destinationVC.difficultyLevel = difficultyButtonPressed
            destinationVC.playerMode = "VsComputer"
        }
    }
    
    @objc func easySwitchChanged(switchState: UISwitch){
        if switchState.isOn {
            mediumSwitch.setOn(false, animated: true)
            hardSwitch.setOn(false, animated: true)
            difficultyButtonPressed = "Easy"
        }
    }
    @objc func mediumSwitchChanged(switchState: UISwitch){
        if switchState.isOn {
            easySwitch.setOn(false, animated: true)
            hardSwitch.setOn(false, animated: true)
            difficultyButtonPressed = "Medium"
        }
    }

    @objc func hardSwitchChanged(switchState: UISwitch){
        if switchState.isOn {
            mediumSwitch.setOn(false, animated: true)
            easySwitch.setOn(false, animated: true)
            difficultyButtonPressed = "Hard"
        }
    }

    
  

}
