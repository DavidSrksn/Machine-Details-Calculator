//
//  Printers.swift
//  Machine Details
//
//  Created by David Sarkisyan on 15.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

extension String{
    
    static func resultHeader(type: ResultType) -> String{
        switch type{
        case .gearStage: return "Количество ступеней редуктора"
        case .gearType: return "Тип редуктора"
        case .scheme: return "Схема"
        }
    }
    
    static func printResult(type: ResultType, result: ResultModel) -> String{
        switch type{
        case .gearStage:
            return resultGearStage(result: result)
        case .gearType:
            return resultGearType(result: result)
        case .scheme:
            return resultScheme(result: result)
        }
    }
    
    static func resultGearStage(result: ResultModel) -> String{
        let gearboxStage = result.gearbox.stageNumber.first
        
        var type: String{
            switch gearboxStage{
            case .one:
                return "одна"
            case .two:
                return "две"
            case .none:
                return ""
            }
        }
        return type
    }
    
    static func resultGearType(result: ResultModel) -> String{
        let gearboxType = result.gearbox.type.first
        
        var type: String{
            switch gearboxType{
            case .conical: return "конический"
            case .cylindrical: return "цилиндрический"
            case .planetary: return "планетарный"
            case .wave: return "волновой"
            case .worm: return "червячный"
            case .none:
                return ""
            }
        }
        return type
    }
    
    static func resultScheme(result: ResultModel) -> String{
        var chainTransmissionText: String = ""
        var beltTransmissionText: String = ""
        if result.chainTransmission != nil{
            chainTransmissionText = "+ цепная передача"
        }
        if result.beltTransmission != nil{
            beltTransmissionText = "+ ремённая пережача"
        }
        return  ("редуктор  \(chainTransmissionText)  \(beltTransmissionText)")
    }
}
