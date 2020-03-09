//
//  OptionA.swift
//  Machine Details
//
//  Created by David Sarkisyan on 08.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

struct SchemeOptionViewModel: OptionViewModelProtocol{
    
    var view = UIView()
    
    init() {
        self.view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    public func setup(option: SchemeOption){
        setupSchemeImageView(option: option)
    }
    
    private func setupSchemeImageView(option: SchemeOption){
        let imageView: UIImageView = UIImageView.scheme(option: option)
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
