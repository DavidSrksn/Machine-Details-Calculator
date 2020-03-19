//
//  GeneratorComponents.swift
//  Machine Details
//
//  Created by David Sarkisyan on 15.03.2020.
//  Copyright © 2020 DavidS. All rights reserved.
//

enum GeneratorFrequency{ // частота
    case low
    case medium
    case high
    case extraHigh
    
    static let allCases: [GeneratorFrequency] = [.low, .medium, .high, .extraHigh]
}

extension GeneratorFrequency: RawRepresentable{
    public typealias RawValue = Double
    
    public init?(rawValue: RawValue) {
        switch rawValue{
        case 750: self = .low
        case 1000: self = .medium
        case 1500: self = .high
        case 3000: self = .extraHigh
        default:
            return nil
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .low: return 750
        case .medium: return 1000
        case .high: return 1500
        case .extraHigh: return 3000
        }
    }
}


