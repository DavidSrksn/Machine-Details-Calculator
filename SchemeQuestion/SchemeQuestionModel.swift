//
//  Model.swift
//  Machine Details
//
//  Created by David Sarkisyan on 07.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

struct SchemeQuestionModel: QuestionModelProtocol {
    
    var questionText: String = "Выберите тип расположения источника и потребителя"
    
    let optionsCases = SchemeOption.allCases
    
    typealias Option =  SchemeOptionViewModel
    
    var options: [OptionViewModelProtocol] {
        configureOptions()
    }
    
    func configureOptions() -> [OptionViewModelProtocol]{
        var options: [OptionViewModelProtocol] = []
        for option in SchemeOption.allCases{
            let model = Option()
            model.setup(option: option)
            options.append(model)
        }
        return options
    }
    
}
