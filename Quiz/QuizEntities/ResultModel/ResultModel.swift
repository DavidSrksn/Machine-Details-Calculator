//
//  ResulModel.swift
//  Machine Details
//
//  Created by David Sarkisyan on 12.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

struct ResultModel {
    
    var gearbox: Gearbox = Gearbox()
    
    var chainTransmission: ChainTransmission? = nil
    
    var beltTransmission: BeltTransmission? = nil
    
    var consumerGenerator: Generator
    
    func gearRatio() -> Double?{
        if gearbox.stageNumber.count == 1 && gearbox.type.count == 1, let _ = gearbox.gearRatio{
            if gearbox.type.count == 1, let geatboxStageNumber = gearbox.stageNumber.last{
                let gearboxGearRatio: Double = gearbox.calculateGearRatio( stageNumber: geatboxStageNumber)
                let chainTransmissionGearRatio: Double = chainTransmission?.gearRatio ?? 1
                let beltTransmissionGearRatio: Double = beltTransmission?.gearRatio ?? 1
                return gearboxGearRatio * chainTransmissionGearRatio * beltTransmissionGearRatio
            }
        }
        return nil
    }
    
    func printResults(){
        printScheme()
        printType()
    }
    
    func printScheme(){
        var chainTransmissionText: String = ""
        var beltTransmissionText: String = ""
        if chainTransmission != nil{
            chainTransmissionText = "chainTransmission"
        }
        if beltTransmission != nil{
            beltTransmissionText = "beltTransmission"
        }
        print("scheme = gearbox + \(chainTransmissionText) + \(beltTransmissionText)")
    }
    
    func printType(){
        print("types :   \(gearbox.type)")
    }
    
}
