//
//  Option.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

protocol OptionViewModelProtocol: class{
    
    var view: UIView {get}
    
    var isSelected: Bool {get set}
    
    func isEmpty() -> Bool
    
    func setup(option: QuizOption)
    
}

extension OptionViewModelProtocol{
    public func isEmpty() -> Bool{
        if self.view.subviews.isEmpty{
            return true
        }
        return false
    }
}
