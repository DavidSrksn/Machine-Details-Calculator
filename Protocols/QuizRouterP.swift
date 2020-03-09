//
//  QuizRouterP.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

protocol QuizRouterProtocol {
    init(viewController: UIViewController)
    
    var viewController: QuizViewController {get set}
    
    var navigationStack: [QuestionModelProtocol] {get set}
        
    func present(new questionModel: QuestionModelProtocol)
}

extension QuizRouterProtocol{

}
