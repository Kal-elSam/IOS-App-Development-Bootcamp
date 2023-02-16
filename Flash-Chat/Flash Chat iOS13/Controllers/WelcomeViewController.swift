//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    var animationStarted = false
    var initialAlpha: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = K.appName
        initialAlpha = titleLabel.alpha

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if !animationStarted {
            startFlashingTitle()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        if animationStarted {
            stopFlashingTitle()
        }
    }
    
    private func startFlashingTitle() {
        animationStarted = true
        UIView.animate(withDuration: 1, delay: 3, options: [.repeat, .autoreverse], animations: {
            self.titleLabel.alpha = 0
        }, completion: nil)
    }
    
    private func stopFlashingTitle() {
        animationStarted = false
        titleLabel.layer.removeAllAnimations()
        titleLabel.alpha = initialAlpha
    }
}
extension UIView {
    func startFlashing(duration: TimeInterval, delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.alpha = 0
            }, completion: nil)
        }
    }
}
