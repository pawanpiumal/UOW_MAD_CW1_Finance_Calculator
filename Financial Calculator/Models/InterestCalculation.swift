//
//  InterestCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-10.
//

import Foundation

class InterestCalculation{
    
    // Simple Interest Calculation Formulas
    func futureValueSimple(presentValue: Double, interest: Double, period: Double) -> Double{
        return presentValue * (1 + interest * period)
    }
    
    func presentValueSimple(futureValue: Double, interest: Double, period: Double) -> Double{
        return futureValue / ( 1 + interest * period)
    }
    
    func simpleInterest(presentValue: Double, futureValue: Double, period: Double ) -> Double{
        return (futureValue - presentValue) / ( presentValue * period) * 100
    }
    
    func periodSimple(presentValue: Double, futureValue: Double, interest: Double ) -> Double{
        return (futureValue - presentValue) / ( presentValue * interest)
    }
    
    // Compound Interest Calculation Formulas
    func futureValueCompound(presentValue: Double, interest: Double, period: Double, compoundPeriod: Double) -> Double{
        return presentValue * pow((1 + interest/compoundPeriod), period * compoundPeriod)
    }
    
    func presentValueCompound(futureValue: Double, interest: Double, period: Double, compoundPeriod: Double) -> Double{
        return futureValue / pow(1 + interest/compoundPeriod, period * compoundPeriod)
    }
    
    func compoundInterest(presentValue: Double, futureValue: Double, period: Double, compoundPeriod: Double) -> Double{
        return (pow(futureValue/presentValue, 1/(period * compoundPeriod)) - 1) * compoundPeriod * 100
    }
    
    func periodCompound(presentValue: Double, futureValue: Double, interest: Double, compoundPeriod: Double) -> Double{
        return (log(futureValue/presentValue) / log(1 + interest/compoundPeriod)) / compoundPeriod
    }

}

enum SavingTypes: String, CaseIterable, Identifiable {
    case futureValue = "Future Value"
    case presentValue = "Present Value"
    case interest = "Interest"
    case period = "Time Period"
    var id: Self { self }
}

enum InterestType: String, CaseIterable, Identifiable{
    case simple, compound
    var id: Self { self}
}
