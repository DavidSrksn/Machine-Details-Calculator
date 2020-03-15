//
//  GearboxComponents.swift
//  Machine Details
//
//  Created by David Sarkisyan on 12.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

enum GearboxType {                // rawValue - average gear ratio
    case cylindrical   // цилиндрический
    case conical       // конический
    case worm          // червячный
    case wave          // волновой
    case planetary     // планетарный
    
    static let allCases: [GearboxType] = [.cylindrical, .conical, .worm, .wave, .planetary]
}

enum GearboxStage: Double {
    case one = 1
    case two = 2
    
    static let allCases: [GearboxStage] = [.one, .two]
}



extension GearboxType: RawRepresentable{
    
    typealias Range = (Double,Double)
    typealias RawValue = (Range,Range?)
    
    init?(rawValue: Self.RawValue) {
        switch rawValue{
        case ((1,6.3),  nil): self = .conical
        case ((1.6, 8),  (12.5, 31.5)? ): self = .cylindrical
        case ((3.15, 8),  (16, 63)? ): self = .planetary
        case ((70, 320), nil): self = .wave
        case ((8,63),  (63, 1000)? ): self = .worm
        case (_, _):
            return nil
        }
    }
    
    var rawValue: GearboxType.RawValue{
        switch self{
        case .conical: return ((1,6.3),  nil)
        case .cylindrical: return ((1.6, 8),  (12.5, 31.5))
        case .planetary: return ((3.15, 8),  (16, 63))
        case .wave: return ((70, 320), nil)
        case .worm: return ((8,63),  (63, 1000))
        }
    }
}
