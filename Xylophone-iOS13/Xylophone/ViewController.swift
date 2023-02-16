//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Declare a variable to hold the AVAudioPlayer object
    var player: AVAudioPlayer?

    // This function is called when a button is pressed
    @IBAction func keyPress(_ sender: UIButton) {
        // Play the sound associated with the pressed button
        playSound(key: sender.currentTitle!)
        
        // Save the original alpha value of the button
        let originalAlpha = sender.alpha

        // Change the button's alpha value to 0.5
        sender.alpha = 0.5

        // Delay code execution by 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Set the button's alpha value back to its original value
            sender.alpha = originalAlpha
        }
    }
    
    // This function plays a sound with the given key
    func playSound(key: String) {
        // Get the URL of the sound file using the key
        let soundURL = Bundle.main.url(forResource: key, withExtension: "wav")
        
        // Try to create an AVAudioPlayer object using the sound file
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
            // If successful, play the sound
            player?.play()
        } catch {
            // If there was an error, print it to the console
            print("Failed to play sound: \(error)")
        }
    }
}

