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
    
    var navigationStack: [QuizQuestionModel] = [QuizQuestionModel(type: .scheme, previousResult: ResultModel())]
    
    func presentNextQuestion(question: QuizQuestionModel){
        let indexOfModel: Int? = navigationStack.firstIndex { (savedQuestion) -> Bool in
            savedQuestion.text == question.text
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
    
    //    public func penultimateResultModel() -> ResultModel? {
    //        let penultimateQuestionModelIndex: Int = navigationStack.count - 2
    //        if penultimateQuestionModelIndex >= 0{
    //            let penultimateQuestionModel = navigationStack[penultimateQuestionModelIndex].previousResult
    //            return penultimateQuestionModel
    //        }
    //        return nil
    //    }
    
    public func deleteNavigation(after question: QuizQuestionModel){
        let indexToDeleteAfter: Int? = navigationStack.firstIndex { (questionModel) -> Bool in
            questionModel.text == question.text
        }
        
        if let indexToDeleteAfter = indexToDeleteAfter, indexToDeleteAfter + 1 <= navigationStack.count - 1 {
            for i in indexToDeleteAfter + 1 ... navigationStack.count - 1{
                navigationStack.remove(at: i)
            }
        }
    }
}
