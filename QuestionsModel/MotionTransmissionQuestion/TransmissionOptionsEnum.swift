//
//  TransmissionOptionsEnum.swift
//  Machine Details
//
//  Created by David Sarkisyan on 09.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

import Foundation

enum TransmissionOption: CaseSequence{
    static let allCases: [TransmissionOption] = [.rightAngle, .zeroAngle]
    
    case rightAngle
    case zeroAngle
}
