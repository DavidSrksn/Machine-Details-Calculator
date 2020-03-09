//
//  TransmissionText.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

extension UILabel{
    static func transmission(option: TransmissionOption) -> UILabel{
        let label = UILabel()
        
        var text: String?{
            switch option{
            case .zeroAngle:
                return "0 градусов"
            case .rightAngle:
                return "прямой угол"
            }
        }
        
        return label
    }
    
}
