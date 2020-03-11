//
//  QuizQuestionModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 10.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import Foundation

struct QuizQuestionModel: QuizQuestionModelProtocol {
    
    var text: String
    
    var options: [OptionViewModelProtocol]
    
    var nextQuestion: QuizQuestionModelProtocol?
    
    private func nextQuestionOptionType(type: QuizQestion) -> QuizQestion?{
        switch type{
        case .scheme:
            return .transmission
        case .transmission:
            return nil
        }
    }
    
    private func setupNextQuestion(type: QuizQestion) -> QuizQuestionModel? {
        let optionType: QuizQestion? = nextQuestionOptionType(type: type)
        if let optionType = optionType{
            return QuizQuestionModel(type: optionType)
        }else {
            return nil
        }
    }
    
    init(type: QuizQestion) {
        
        self.text = String.questionText(questionType: type)
        
        self.options = []
        for quizOption in QuizOption.allCases{
            let option = type.rawValue
            option.setup(option: quizOption)
            self.options.append(option)
        }
        
        
        var optionType: QuizQestion? {
            switch type{
            case .scheme:
                return .transmission
            case .transmission:
                return nil
            }
        }
        
        var nextQuestion: QuizQuestionModelProtocol? {
            let optionType: QuizQestion? = nextQuestionOptionType(type: type)
            if let optionType = optionType{
                return QuizQuestionModel(type: optionType)
            }else {
                return nil
            }
        }
        self.nextQuestion = nextQuestion
    }
    
}


// MARK: For Next Question (if needed)

