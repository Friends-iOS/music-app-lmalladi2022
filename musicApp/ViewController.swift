//
//  ViewController.swift
//  musicApp
//
//  Created by Adam Jackrel on 2/28/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var myRoundedLabel1: UIButton!
    @IBOutlet weak var myRoundedLabel2: UIButton!
    @IBOutlet weak var myRoundedLabel3: UIButton!
    @IBOutlet weak var myRoundedLabel4: UIButton!
    
    
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myRoundedLabel1.layer.cornerRadius = 50
        self.myRoundedLabel2.layer.cornerRadius = 50
        self.myRoundedLabel3.layer.cornerRadius = 50
        self.myRoundedLabel4.layer.cornerRadius = 50
    }

    @IBAction func buttonKeyPressed(_ sender: UIButton) {
       playSound(label: sender.currentTitle!)
    }
    
func playSound(label : String) {
      
       guard let url = Bundle.main.url(forResource: label, withExtension: "mp3") else { return }

          do {
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
              try AVAudioSession.sharedInstance().setActive(true)

              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


              guard let player = player else { return }
              player.play()

          } catch let error {
              print(error.localizedDescription)
          }
      }
    
    
}

