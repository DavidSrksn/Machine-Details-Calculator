//
//  QuestionModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import Foundation

protocol QuestionModelProtocol{
    var questionText: String {get}
    
    var options: [OptionViewModelProtocol] {get}
    
    func configureOptions() -> [OptionViewModelProtocol]
}
