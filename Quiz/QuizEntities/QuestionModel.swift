//
//  QuizQuestionModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 10.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import Foundation

class QuizQuestionModel: QuizQuestionModelProtocol {
    
    var text: String
    
    var options: [OptionViewModelProtocol]
    
    var nextQuestionType: QuizQestion?
    
    var previousResult: ResultModel!
    
    init(type: QuizQestion, previousResult: ResultModel) {
        
        self.text = String.questionText(questionType: type)
        
        self.options = []
        for quizOption in QuizOption.allCases{
            let option = type.rawValue
            option.setup(option: quizOption)
            if !option.isEmpty(){
                self.options.append(option)
            }
        }
        
        self.nextQuestionType = nextQuestionOptionType(type: type)
        
        self.previousResult = previousResult
    }
    
    private func selectedOption() -> OptionViewModelProtocol? {
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
    
    public func nextQuestion(previousResult: ResultModel) -> QuizQuestionModel? {
        if let questionType = nextQuestionType{
                return QuizQuestionModel(type: questionType, previousResult: previousResult )
        }
        return nil
    }
    
    public func changeResult(result: inout ResultModel) {
        let optionIndex: Int? = options.firstIndex(where: { (option) -> Bool in
            option.isSelected == true
        })
        
        if let optionIndex = optionIndex{
            let option: QuizOption = QuizOption.allCases[optionIndex]
            selectedOption()?.result(resultModel: &result, option: option)
        }
    }
    
}


// MARK: For Next Question (if needed)

