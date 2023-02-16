//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Propiedades de salida conectadas a elementos de la interfaz de usuario
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    // Instancia de la clase QuizBrain para manejar el lógico del juego
    var quizBrain = QuizBrain()
    // Método que se llama cuando la vista de la aplicación se carga por primera vez
    override func viewDidLoad() {
        super.viewDidLoad()
        // Actualiza la interfaz de usuario al iniciar la aplicación
        updateUI()
    }
    // Método que se llama cuando se presiona uno de los botones "verdadero" o "falso"
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Recupera el título del botón presionado como la respuesta del usuario
        let userAnswer = sender.currentTitle!
        // Verifica si la respuesta del usuario es correcta llamando a checkAnswer(_:) en quizBrain
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        // Si el usuario respondió correctamente, cambia el color de fondo del botón a verde
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        // Avanza a la siguiente pregunta en quizBrain
        quizBrain.nextQuestion()
        // Programa un temporizador para llamar a updateUI() en 0,2 segundos
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    // Método que actualiza la interfaz de usuario con la siguiente pregunta y el progreso actual del cuestionario
    @objc func updateUI() {
        // Establece el texto de questionLabel con la siguiente pregunta del cuestionario
        questionLabel.text = quizBrain.getQuestionText()
        // Establece el progreso de la barra de progreso con el progreso actual del cuestionario
        progressBar.progress = quizBrain.getProgress()
        // Establece el texto de scoreLabel con la puntuación actual
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
}

