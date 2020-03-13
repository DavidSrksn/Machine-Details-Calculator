//
//  Interactor.swift
//  Machine Details
//
//  Created by David Sarkisyan on 12.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

class Interactor{
        
    var questionModel: QuizQuestionModel!
    
    func changeResult(){
        questionModel.changeResult()
    }
    
    init(resultModel: ResultModel, model: QuizQuestionModel ) {
        self.questionModel = model
    }
    
    public func changeQuestionModel(model: QuizQuestionModel){
        self.questionModel = model
    }
}
