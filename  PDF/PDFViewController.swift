//
//  PDFViewController.swift
//  Machine Details
//
//  Created by David Sarkisyan on 16.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController{
    
    var documentData: Data?
    let pdfView = PDFView()
    
    let shareButton = UIButton()
    let savedNotificationLabel = UILabel()
    
    init(documentData: Data?) {
        self.documentData = documentData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        if let data = documentData {
          pdfView.document = PDFDocument(data: data)
          pdfView.autoScales = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pdfView.backgroundColor = .black
        setupPDFView()
        setupShareButton()
    }
    
    override func viewDidAppear(_ animated: Bool){
        if type(of: presentingViewController) == QuizFinalViewController.self{
            setupSavedNotificationView()
        }
    }
    
    func setupPDFView(){
        view.addSubview(pdfView)
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        
        pdfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pdfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupShareButton(){
        view.addSubview(shareButton)
        shareButton.addTarget(nil, action: #selector(sharePDF), for: .touchUpInside)
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.5).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        shareButton.setTitle("Поделиться", for: .normal)
        shareButton.setTitleColor( UIColor.Customs.lightBlack, for: .normal)
        
        shareButton.backgroundColor = .white
        shareButton.layer.cornerRadius = 20
    }
    
    @objc func sharePDF(){
        if let data = documentData{
        let activityController = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
        }
    }
    
    func setupSavedNotificationView(){
        view.addSubview(savedNotificationLabel)
        
        savedNotificationLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.6, height: view.frame.width * 0.6)
        savedNotificationLabel.center = view.center
        
        savedNotificationLabel.alpha = 0
        savedNotificationLabel.layer.cornerRadius = 20
        
        savedNotificationLabel.backgroundColor = UIColor.Customs.lightBlack
        savedNotificationLabel.textColor = .white

        savedNotificationLabel.textAlignment = .center
        savedNotificationLabel.text = "Сохранено \u{2713}"
        savedNotificationLabel.font = UIFont(name: "HelveticaNeue", size: 25)
        
        UIView.animate(withDuration: 2) {
            self.savedNotificationLabel.alpha = 1
        }
        UIView.animate(withDuration: 2) {
            self.savedNotificationLabel.alpha = 0
        }
    }
    
}
