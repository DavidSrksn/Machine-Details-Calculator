//
//  QuizRouter.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit
import Foundation

class QuizRouter: QuizRouterProtocol {

    var viewController: QuizViewController
    
    required init(viewController: UIViewController) {
        self.viewController = viewController as! QuizViewController
    }
    
    var navigationStack: [QuizQuestionModel] = []
    
    func presentNextQuestion(question: QuizQuestionModel){
        let indexOfModel: Int? = navigationStack.firstIndex { (savedQuestion) -> Bool in
            savedQuestion.text == question.text
        }
        if let nextModelIndex = indexOfModel{
            viewController.questionModel = navigationStack[nextModelIndex]
        }else{
            navigationStack.append(question)
            viewController.questionModel = navigationStack.last!
        }
    }
    
    func presentPreviousQuestion(){
        let currentQuestionIndex: Int? = navigationStack.firstIndex { (question) -> Bool in
            question.text == viewController.questionModel.text
        }
        
        if let currentQuestionIndex = currentQuestionIndex{
            let previousIndex: Int = currentQuestionIndex - 1
            if previousIndex >= 0{
                viewController.questionModel = navigationStack[previousIndex]
            }
        }else{
            viewController.questionModel = navigationStack.last!
        }
    }
    
    public func deleteNavigation(after question: QuizQuestionModel){
        let indexToDeleteAfter: Int? = navigationStack.firstIndex { (questionModel) -> Bool in
            questionModel.text == question.text
        }
        
        if let indexToDeleteAfter = indexToDeleteAfter, indexToDeleteAfter + 1 <= navigationStack.count - 1 {
            for _ in indexToDeleteAfter + 1 ..< navigationStack.count {
                navigationStack.removeLast()
            }
        }
    }
    
}
