//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by sam gomez on 22/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
// Estructura que representa una pregunta y una respuesta

struct Question {
    let text: String
    let answer: String
    // Inicializador que toma una pregunta y una respuesta como parámetros
    init (q: String, a: String) {
        text = q
        answer = a
    }
}
