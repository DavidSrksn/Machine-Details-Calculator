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
    
    func gearRation() -> Float?{
        if gearbox.stageNumber.count == 1 && gearbox.type.count == 1{
            if let gearboxType = gearbox.type.last, let geatboxStageNumber = gearbox.stageNumber.last{
                let gearboxGearRatio: Float = gearbox.gearRatio(type: gearboxType, stageNumber: geatboxStageNumber)
                let chainTransmissionGearRatio: Float = chainTransmission?.gearRatio ?? 1
                let beltTransmissionGearRatio: Float = beltTransmission?.gearRatio ?? 1
                return gearboxGearRatio * chainTransmissionGearRatio * beltTransmissionGearRatio
            }
        }
        return nil
    }
    
    internal func printResults(){
        printScheme()
        printType()
    }
    
    private func printScheme(){
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
    
    private func printType(){
        print("types :   \(gearbox.type)")
    }
    
}
