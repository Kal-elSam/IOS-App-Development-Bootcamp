//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets para imágenes de dados
    // Cada outlet se refiere a una imagen en la interfaz de usuario
    // que muestra un dado
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    // Acción del botón que se llama cuando el usuario presiona el botón "tirar"
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // Array que contiene imágenes de todos los posibles valores de dado
        var diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        
        // Elige dos números aleatorios para seleccionar dos imágenes de dado
        // aleatorias del array diceArray
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        // Actualiza la interfaz de usuario para mostrar los nuevos dados
        
    }
    
}
