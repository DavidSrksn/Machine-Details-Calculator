//
//  File.swift
//  Machine Details
//
//  Created by David Sarkisyan on 14.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

class StartViewController: UIViewController{
    
    var startButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .white
        setupStartButton()
    }
    
    
    func setupStartButton(){
        view.addSubview(startButton)
        
        startButton.addTarget(nil, action: #selector(startButtonAction), for: .touchUpInside)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.65).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100 ).isActive = true
        
        startButton.backgroundColor = UIColor.Customs.lightGreen
        startButton.layer.cornerRadius = 20
        
        startButton.setTitle("Начать", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
    }
    
    @objc func startButtonAction(){
        self.presentFullscreen(viewController: QuizViewController())
    }
}
