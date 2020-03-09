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
    
    init() {
        self.view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    public func setup(option: TransmissionOption){
        setupSchemeLabel(option: option)
    }
    
    private func setupSchemeLabel(option: TransmissionOption){
        let label: UILabel = UILabel.transmission(option: option)
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
