//
//  ViewController.swift
//  You Are Awesome!!
//
//  Created by 周纯稚 on 21/01/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfSounds = 6
    let numberOfImages = 10
    var soundName = ""
    
    // This code executes when the vire controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: My Own Func
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName) {
            // check if sound.data is a sound file
            
            do {
                try audioPlayer = AVAudioPlayer(data:sound.data)
                audioPlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            // if reading in the NSDataAsset didn't work,
            //tell the user/ report the error.
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
                newIndex = Int(arc4random_uniform(UInt32(maxValue)))
            } while lastNumber == newIndex
        return newIndex
    }
    
    // MARK: - Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            // stop playing
            awesomePlayer.stop()
        }
    }
    
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
    let messages = ["You Are Fantastic!",
                    "You Are Great!",
                    "You Are Amazing!",
                    "When The Genius Bar needs help, they call you!",
                    "You Brighten My Day!",
                    "I can't wait to use your app!",
                    "You are Da Bomb!",
                    "Fabulous? That's You!"]
  
        // Show a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // Show an image
        awesomeImage.isHidden = false // Show the image
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn {
            // Get a random number to use in our soundName file
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            
            // Play a sound
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        
    }
    
    
}



    //        var randomIndex =
    //            Int(arc4random_uniform(UInt32(messages.count)))
    //        messageLabel.text = messages[randomIndex]
    
    
    
    /*
     messageLabel.text = messages[index]
     index = index + 1
     
     if index == messages.count {
     index = 0
     }
     */
    
    
//        let message1 = "You Are Fantastic!!!!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        } else if messageLabel.text == message2 {
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
//        }
 
//        command + /   hide all
        // control +I   align

    

