//
//  File.swift
//  Machine Details
//
//  Created by David Sarkisyan on 14.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

class StartViewController: UIViewController{
    
    let openExistingButton = UIButton()
    let startButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .white
        setupStartButton()
        setupOpenExistingButton()
        setupTickerView()
    }
    
    func setupTickerView(){
        let superView = UIView()
        let tickerLabel = UILabel()
        
        view.addSubview(superView)
         
        superView.frame = CGRect(x: 0, y: view.bounds.maxY - 50, width: view.bounds.width, height: 50)
        tickerLabel.frame = superView.bounds
        
        tickerLabel.text = "created by DavidS"
        tickerLabel.textAlignment = .center
        
        let tickerView = TickerView(duration: 5, tickerView: tickerLabel, superView: superView, interval: 30)
        tickerView.start()
    }
    
    func setupStartButton(){
        view.addSubview(startButton)
        
        startButton.addTarget(nil, action: #selector(startButtonAction), for: .touchUpInside)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.65).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20 ).isActive = true
        
        startButton.backgroundColor = UIColor.Customs.lightGreen
        startButton.layer.cornerRadius = 20
        
        startButton.setTitle("Начать", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
    }
    
    @objc func startButtonAction(){
        self.presentFullscreen(viewController: InputDataViewController())
    }
    
    @objc func openExistingButtonAction(){
        let viewController = SavedFilesViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setupOpenExistingButton(){
        view.addSubview(openExistingButton)
        
        openExistingButton.addTarget(nil, action: #selector(openExistingButtonAction), for: .touchUpInside)
        
        openExistingButton.translatesAutoresizingMaskIntoConstraints = false
        
        openExistingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openExistingButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        openExistingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        openExistingButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 30 ).isActive = true
        
        openExistingButton.backgroundColor = UIColor.Customs.lightBlack
        openExistingButton.layer.cornerRadius = 20
        
        openExistingButton.setTitle("Открыть имеющийся", for: .normal)
        openExistingButton.setTitleColor(.white, for: .normal)
    }
    
}
