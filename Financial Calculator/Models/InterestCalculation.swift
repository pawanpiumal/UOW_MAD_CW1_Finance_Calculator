//
//  InterestCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-10.
//

import Foundation

class InterestCalculation{
    
    // Simple Interest Calculation Formulas
    
    // calculate future value
    func futureValueSimple(presentValue: Double, interest: Double, period: Double) -> Double{
        return presentValue * (1 + interest * period)
    }
    
    // Calculate present value
    func presentValueSimple(futureValue: Double, interest: Double, period: Double) -> Double{
        return futureValue / ( 1 + interest * period)
    }
    
    // calculate interest
    func simpleInterest(presentValue: Double, futureValue: Double, period: Double ) -> Double{
        return (futureValue - presentValue) / ( presentValue * period) * 100
    }
    
    // calculate time period
    func periodSimple(presentValue: Double, futureValue: Double, interest: Double ) -> Double{
        return (futureValue - presentValue) / ( presentValue * interest)
    }
    
    // Compound Interest Calculation Formulas
    
    // calculate future value
    func futureValueCompound(presentValue: Double, interest: Double, period: Double, compoundPeriod: Double) -> Double{
        return presentValue * pow((1 + interest/compoundPeriod), period * compoundPeriod)
    }
    
    // calculate present value
    func presentValueCompound(futureValue: Double, interest: Double, period: Double, compoundPeriod: Double) -> Double{
        return futureValue / pow(1 + interest/compoundPeriod, period * compoundPeriod)
    }
    
    // calculate interest
    func compoundInterest(presentValue: Double, futureValue: Double, period: Double, compoundPeriod: Double) -> Double{
        return (pow(futureValue/presentValue, 1/(period * compoundPeriod)) - 1) * compoundPeriod * 100
    }
    
    // calculate time period
    func periodCompound(presentValue: Double, futureValue: Double, interest: Double, compoundPeriod: Double) -> Double{
        return (log(futureValue/presentValue) / log(1 + interest/compoundPeriod)) / compoundPeriod
    }

}

// results from the interest screen
enum SavingTypes: String, CaseIterable, Identifiable {
    case futureValue = "Future Value"
    case presentValue = "Present Value"
    case interest = "Interest"
    case period = "Time Period"
    var id: Self { self }
}

// interest type
enum InterestType: String, CaseIterable, Identifiable{
    case simple, compound
    var id: Self { self}
}
