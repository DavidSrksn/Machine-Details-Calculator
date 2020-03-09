//
//  SchemeImage.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

extension UIImageView{
    static func scheme(option: SchemeOption) -> UIImageView{
        let imageView = UIImageView()
        
        var image: UIImage?{
        switch option{
        case .reductionGear:
            return UIImage(named: "scheme")
        case .withBelting:
            return UIImage(named: "scheme")
        case .withChainDrive:
            return UIImage(named: "scheme")
        }
    }
        
        if let image = image{
            imageView.image = image
            return imageView
        }
        return imageView
    }
    
}
