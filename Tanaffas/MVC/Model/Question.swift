//
//  Question.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import Foundation

struct Question {
    
    let questionText : String
    let questionAnswer : [String]   

    init(text: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        questionText = text
        questionAnswer = [answer1, answer2, answer3, answer4]
    }
    
}
