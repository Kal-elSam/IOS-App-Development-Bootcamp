//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        
        if email.count > 0 && password.count > 0 {
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let error = error {
                    // Error handling
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    // Successful sign in
                    print("Successfully signed in.")
                    // Aquí podrías navegar a la siguiente pantalla o hacer cualquier otra acción necesaria
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        } else {
            // Mostrar un mensaje de error al usuario que no ha completado los campos de email y contraseña
            let alert = UIAlertController(title: "Error", message: "Email and password fields cannot be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
