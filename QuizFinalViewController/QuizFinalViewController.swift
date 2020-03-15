//
//  QuizFinalViewController.swift
//  Machine Details
//
//  Created by David Sarkisyan on 15.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit


class QuizFinalViewController: UIViewController{
    
    var result: ResultModel
    
    let resultHeaderLabel = UILabel()
    let resultStackView = UIStackView()
    let scrollView = UIScrollView()
    
    let savePDFButton = UIButton()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    init(result: ResultModel) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        calculateResult()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor.Customs.lightBlack
        setupResultHeaderLabel()
        setupSavePDFButton()
        setupScrollView()
        setupResultStackView()
    }
    
    func calculateResult(){
        if let gearboxType = result.gearbox.type.first{
            let (oneStageRange, twoStageRange) = gearboxType.rawValue
        }
    }
    
    func setupResultHeaderLabel(){
        view.addSubview(resultHeaderLabel)
        
        resultHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultHeaderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        resultHeaderLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        resultHeaderLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        resultHeaderLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        resultHeaderLabel.textColor = .white
        resultHeaderLabel.font = UIFont(name: "HelveticaNeue", size: 35)
        resultHeaderLabel.numberOfLines = 0
        resultHeaderLabel.text = "Результаты"
        resultHeaderLabel.textAlignment = .center
    }
    
    func setupSavePDFButton(){
        view.addSubview(savePDFButton)
        
        savePDFButton.translatesAutoresizingMaskIntoConstraints = false
        
        savePDFButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        savePDFButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        savePDFButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.65).isActive = true
        savePDFButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        savePDFButton.backgroundColor = .white
        savePDFButton.layer.cornerRadius = 20
        
        savePDFButton.setTitle("Сохранить в PDF", for: .normal)
        savePDFButton.setTitleColor(UIColor.Customs.lightBlack, for: .normal)
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: resultHeaderLabel.bottomAnchor, constant: 10).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollView.contentSize.height = 1
        scrollView.backgroundColor = .clear
    }
    
    func setupResultStackView(){
        resultStackView.axis = .vertical
        resultStackView.distribution = .fillEqually
        resultStackView.spacing = 60
        
        resultStackView.tintColor = .black
        
        scrollView.addSubview(resultStackView)
        
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        
        resultStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        resultStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        resultStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        resultStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        
        for type in ResultType.allCases{
            resultStackView.addArrangedSubview(componentStackView(headerLabel: UILabel.resultHeader(type: type), description: UILabel.resultLabel(type: type, result: result)))
        }
        
    }
    
    func componentStackView(headerLabel: UILabel, description: UILabel) -> UIStackView{
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        
        stackView.tintColor = .black
        
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(description)
        
        return stackView
    }
    
//    func printResult() -> String{
//        if let gearType = result.gearbox.type.first, let gearStage = result.gearbox.stageNumber.first{
//            let scheme: String =  String.resultScheme(result: result) + "\n"
//            let gearboxType: String = String.resultType(gearboxType: gearType) + "\n"
//            let gearboxStage: String = String(describing: gearStage) + "\n"
//
//            return scheme + gearboxType + gearboxStage
//        }else{
//            return "Ошибка, попробуйте заново"
//        }
//    }
}
