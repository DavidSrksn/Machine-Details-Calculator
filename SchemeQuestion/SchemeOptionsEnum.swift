//
//  SchemeOptionB.swift
//  Machine Details
//
//  Created by David Sarkisyan on 08.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import UIKit

enum SchemeOption: CaseSequence{
    static let allCases: [SchemeOption] = [.reductionGear, .withChainDrive, .withBelting]
    
    case reductionGear
    case withChainDrive
    case withBelting
}
