//
//  GearboxComponents.swift
//  Machine Details
//
//  Created by David Sarkisyan on 12.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

enum GearboxType: Float {                // rawValue - average gear ratio
    case cylindrical = 1  // цилиндрический
    case conical = 2      // конический
    case worm = 3         // червячный
    case wave = 4         // волновой
    case planetary = 5    // планетарный
    
    static let allCases: [GearboxType] = [.cylindrical, .conical, .worm, .wave, .planetary]
}

enum GearboxStage: Float {
    case one = 1
    case two = 2
    
    static let allCases: [GearboxStage] = [.one, .two]
}
