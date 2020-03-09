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
    
    var navigationStack: [QuestionModelProtocol] = []
    
    func present(new questionModel: QuestionModelProtocol) {
        viewController.model = questionModel
        
    }
}
