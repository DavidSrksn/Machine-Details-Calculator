//
//  Option.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

protocol OptionViewModelProtocol{
    
    var view: UIView {get}
    
    var isSelected: Bool {get set}
    
    func setup(option: QuizOption)
    
}

extension OptionViewModelProtocol{
//    mutating func setSelected(){
//        let alreadySelectedIndex: Int? = question.options.firstIndex { (option) -> Bool in
//            return option.isSelected == true
//        }
//        
//        if let alreadySelectedIndex = alreadySelectedIndex{
//            question.options[alreadySelectedIndex].isSelected = false
//        }
//        
//        isSelected = true
//    }
    
}
