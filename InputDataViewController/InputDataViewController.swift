//
//  InputDataViewController.swift
//  Machine Details
//
//  Created by David Sarkisyan on 15.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

enum InputDataTextField{ // для delegate
    case power
    case frequency
}

protocol InputDataViewControllerProtocol: class{
    
    func setAlertWarning(message: String)
    
    func setShimmerWarning(textfieldType: InputDataTextField)
    
    func presentViewController(viewController: UIViewController)
    
}

final class InputDataViewController: UIViewController, UITextFieldDelegate, InputDataViewControllerProtocol{
           
    var presenter: InputDataPresenter!
    
    let scrollView = UIScrollView()
        
    let headerLabel = UILabel()
        
    let mainStackView = UIStackView()
    
    let powerTextField = UITextField()
    let frequencyTextField = UITextField()
    
    let continueButton = UIButton()
    
    var generatorModel = Generator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMVP()
        setupKeyboardLayout()
        powerTextField.delegate = self
        frequencyTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScrollView()
        view.backgroundColor = .white
        setupHeader()
        setupMainStackView()
        setupLoginButton()
    }
    
    func setupMVP(){
        let presenter = InputDataPresenter(viewController: self)
        self.presenter = presenter
    }
    
    func presentViewController(viewController: UIViewController) {
        self.modalTransitionStyle = .coverVertical
        self.presentFullscreen(viewController: viewController)
    }
    
    func setAlertWarning(message: String) {
        showWarning(message: message)
    }
    
    func setShimmerWarning(textfieldType: InputDataTextField) {
        switch textfieldType {
        case .frequency:
            frequencyTextField.warning()
        case .power:
            powerTextField.warning()
        }
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        scrollView.contentSize.height = 1
        scrollView.backgroundColor = .clear
    }
    
    func setupLoginButton(){
        continueButton.addTarget(.none, action: #selector(loginButtonAction), for: .touchUpInside)
        
        scrollView.addSubview(continueButton)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        continueButton.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 40).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        continueButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        
        continueButton.alpha = 0.25
        
        continueButton.layer.cornerRadius = powerTextField.layer.cornerRadius
        continueButton.backgroundColor = .black
    }
    
    @objc func loginButtonAction(){
        let power = powerTextField.text!
        let frequency = frequencyTextField.text!

        if power == "" && frequency == ""  {
            presenter.showAlertWarning(message: "Заполните поля")
        }else if (!power.isAllowed() || power == "") && (!frequency.isAllowed() || frequency == ""){
            presenter.showShimmerWarning(textfieldType: .power)
            presenter.showShimmerWarning(textfieldType: .frequency)
            presenter.showAlertWarning(message: "Заполните поля корректно")
        }else if !power.isAllowed() || power == ""{
            presenter.showShimmerWarning(textfieldType: .power)
        }else if !frequency.isAllowed() || frequency == ""{
            presenter.showShimmerWarning(textfieldType: .frequency)
        }else{
            setupGenerator()
            presenter.presentQuizViewController(generator: self.generatorModel)
        }
    }
    
    func setupGenerator(){
        let frequency: Int? = Int(frequencyTextField.text!)
        let power: Float? = Float(powerTextField.text!)
        
        self.generatorModel = Generator(frequency: frequency, power: power)
    }
    
    func setupHeader(){
        scrollView.addSubview(headerLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        headerLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerLabel.numberOfLines = 0
        headerLabel.textColor = .black
        headerLabel.font = UIFont(name: "HelveticaNeue", size: 40)
        headerLabel.text = "Введите входные данные"
        headerLabel.textAlignment = .center
    }
    
    func setupTextField(textField: UITextField,placeHolder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder,attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        
        textField.textColor = .black
    }
    
    func textFieldHeaderLabel(text: String) -> UILabel{
        let headerOfTextFireld = UILabel()
        
        headerOfTextFireld.numberOfLines = 2
        headerOfTextFireld.textColor = .black
        headerOfTextFireld.font = UIFont(name: "HelveticaNeue", size: 30)
        headerOfTextFireld.textAlignment = .left
        headerOfTextFireld.text = text
        
        return headerOfTextFireld
    }
    
    func setupMainStackView(){
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 50
        
        mainStackView.tintColor = .black
        
        scrollView.addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        mainStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        
        mainStackView.addArrangedSubview(componentStackView(textField: powerTextField, headerLabelText: "Мощность потребителя, кВт"))
        mainStackView.addArrangedSubview(componentStackView(textField: frequencyTextField, headerLabelText: "Частота потребителя, Гц"))
    }
    
    func componentStackView(textField: UITextField, headerLabelText: String) -> UIStackView{
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        stackView.tintColor = .black
        
        stackView.addArrangedSubview(textFieldHeaderLabel(text: headerLabelText))
        
        setupTextField(textField: textField, placeHolder: headerLabelText)
        stackView.addArrangedSubview(textField)
        
        return stackView
    }
}

//MARK: TextFieldDelegate

extension InputDataViewController {

    private func keyForTextfield(textField: UITextField) -> InputDataTextField{
        if textField === powerTextField{
            return .power
        }else if textField === frequencyTextField{
            return .frequency
        }else{return .power}
    }

    func textFieldDidBeginEditing(_ textField: UITextField){
        if textField.status == .empty{
            UIView.animate(withDuration: 1) {
                self.continueButton.alpha += 0.25
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField){
        textField.changeStatus(textField: textField)

        switch textField.status{
        case .correct:
            return
        case .incorrect, .empty:
            UIView.animate(withDuration: 1) {
                if self.continueButton.alpha > 0.25{
                    self.continueButton.alpha -= 0.25
                }
            }
        }
    }

}

// MARK: Keyboard layput

extension InputDataViewController{
    @objc func keyboardWillShow(notification: NSNotification){
        guard let userInfo = notification.userInfo else{return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else{return}
        let keyboardFrame = keyboardSize.cgRectValue.height

        if view.frame.origin.y == 0{
            view.frame.origin.y -= keyboardFrame / 2.3
            scrollView.contentSize.height = view.frame.height + keyboardFrame / 1.5
        }
    }

    @objc func keyboardWillHide(notification: NSNotification){
        view.frame.origin.y = 0
        self.scrollView.contentSize.height = 1.0
    }

    public func setupKeyboardLayout(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}
