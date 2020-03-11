//
//  QuestionModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//


protocol QuizQuestionModelProtocol{
    
    var text: String {get set}
    
    var options: [OptionViewModelProtocol] {get set}
        
    var nextQuestion: QuizQuestionModelProtocol? {get}
    
}
