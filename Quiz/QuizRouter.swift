//
//  QuizRouter.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

class QuizRouter: QuizRouterProtocol {

    var viewController: QuizViewController
    
    required init(viewController: UIViewController) {
        self.viewController = viewController as! QuizViewController
    }
    
    var navigationStack: [QuizQuestionModel] = [QuizQuestionModel(type: .scheme)]
    
    func presentNextQuestion(question: QuizQuestionModel){
        let indexOfModel: Int? = navigationStack.firstIndex { (question) -> Bool in
            question.text == question.text
        }
        if let nextModelIndex = indexOfModel{
            viewController.questionModel = navigationStack[nextModelIndex]
        }else{
            navigationStack.append(question)
            viewController.questionModel = navigationStack.last
        }
    }
    
    func presentPreviousQuestion(){
        let previousIndex: Int = navigationStack.count - 2
        
        if previousIndex >= 0{
            viewController.questionModel = navigationStack[previousIndex]
        }else{
            viewController.questionModel = navigationStack.last!
        }
    }
}
