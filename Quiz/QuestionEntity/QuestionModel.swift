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
    
    var nextQuestion: QuizQuestionModelProtocol?      // Узнать: есть ли опасность рекурсивного вызова
    
    init(type: QuizQestion) {
        
        self.text = String.questionText(questionType: type)
        
        self.options = []
        for quizOption in QuizOption.allCases{
            let option = type.rawValue
            option.setup(option: quizOption)
            if !option.isEmpty(){
                self.options.append(option)
            }
        }
        
        self.nextQuestion = setupNextQuestion(type: type)
    }
    
    public func selectedOption() -> OptionViewModelProtocol? {
        let option: OptionViewModelProtocol? = options.first { (option) -> Bool in
            option.isSelected == true
        }
        return option
    }
    
    public func setOptionSelected(index: Int){
        let alreadySelectedOption = selectedOption()
        alreadySelectedOption?.isSelected = false
        
        let selectedOption = options[index]
        selectedOption.isSelected = true
        
    }
    
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
    
}


// MARK: For Next Question (if needed)

