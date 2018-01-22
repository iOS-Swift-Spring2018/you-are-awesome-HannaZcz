//
//  ViewController.swift
//  You Are Awesome!!
//
//  Created by 周纯稚 on 21/01/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    var index = 0
    
    // This code executes when the vire controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
    let messages = ["You Are Fantastic!",
                    "You Are Great!",
                    "You Are Amazing!",
                    "When The Genius Bar needs help, they call you!",
                    "You Brighten My Day!",
                    "Can't wait to use!",
                    "You are da bomb!"]
        
        messageLabel.text = messages[index]
        index = index + 1
        
        if index == messages.count {
            index = 0
        }
        }
     
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
    }
    

