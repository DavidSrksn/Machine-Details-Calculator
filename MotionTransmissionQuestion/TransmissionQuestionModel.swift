//
//  TransmissionQuestionModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import Foundation

struct TransmissionQuestionModel: QuestionModelProtocol {
    
    var questionText: String = "Выберите тип расположения источника и потребителя"
    
    let optionsCases = TransmissionOption.allCases
    
    typealias Option =  TransmissionOptionViewModel
    
    var options: [OptionViewModelProtocol] {
        configureOptions()
    }
   
    func configureOptions() -> [OptionViewModelProtocol]{
        var options: [OptionViewModelProtocol] = []
        for option in self.optionsCases{
            let model = Option()
            model.setup(option: option)
            options.append(model)
        }
        return options
    }
    
}
