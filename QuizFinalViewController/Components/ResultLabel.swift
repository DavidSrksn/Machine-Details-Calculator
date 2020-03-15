//
//  ResultLabel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 15.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

internal enum ResultType{
    case scheme
    case gearType
    case gearStage
    
    static let allCases: [ResultType] = [.scheme, .gearType, .gearStage]
}

extension UILabel{
    static func resultLabel(type: ResultType, result: ResultModel) -> UILabel{
        let label = UILabel()
        
        label.numberOfLines = 0
        label.text = String.printResult(type: type, result: result)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 25)
        label.layer.cornerRadius = 20
        
        label.layer.borderWidth = 1.6
        label.layer.borderColor = UIColor.white.cgColor
        
        return label
    }
    
    static func resultHeader(type: ResultType) -> UILabel{
        let label = UILabel()
        
        label.numberOfLines = 0
        label.text = String.resultHeader(type: type)
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 40)
        label.layer.cornerRadius = 20
        
        return label
    }
}
