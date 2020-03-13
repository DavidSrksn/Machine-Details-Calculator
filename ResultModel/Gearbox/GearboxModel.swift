//
//  Gearbox.swift
//  Machine Details
//
//  Created by David Sarkisyan on 12.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//


struct Gearbox{
    
    var type: [GearboxType]
    
    var stageNumber: [GearboxStage]
    
    func gearRatio(type: GearboxType,stageNumber: GearboxStage) -> Float {
        let gearboxGearRation: Float = type.rawValue * stageNumber.rawValue
        return gearboxGearRation
    }
    
    init() {
        self.type = GearboxType.allCases
        self.stageNumber = GearboxStage.allCases
    }
}
