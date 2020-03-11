//
//  TransmissionOptionViewModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

struct TransmissionOptionViewModel: OptionViewModelProtocol{
    
    var view = UIView()
    
    var isSelected: Bool = false
    
    public func setup(option: QuizOption){
        setupSchemeLabel(option: option)
    }
    
    private func setupSchemeLabel(option: QuizOption){
        let label: UILabel? = UILabel.transmission(option: option)
        
        if let label = label{
            view.addSubview(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
    
}
