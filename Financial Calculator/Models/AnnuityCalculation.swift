//
//  AnnuityCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-15.
//

import Foundation

class AnnuityCalculation{
    
    // Ordinary Annuity  - Payment at end of period
    
    //Calculate future value
    func futureValueOrdinary (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = payment * (pow(1 + p, period * paymentPerYear) - 1) / p
        return initialFutureValue + paymentFutureValue
    }
    
    // Calculate present value
    func presentValueOrdinary (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let paymentPresentValue = payment * (1 - pow(1 + p, -period * paymentPerYear)) / p
        return initialInvestment + paymentPresentValue
    }
    
    // Calculate initial investment necessary to get a given future value and payment
    func initialInvestmentOrdinary(futureValue: Double, payment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let paymentFutureValue = payment * (pow(1 + p, period * paymentPerYear) - 1) / p
        let investmentFutureValue = futureValue - paymentFutureValue
        return InterestCalculation().presentValueCompound(futureValue: investmentFutureValue, interest: interest, period: period, compoundPeriod: interestPerYear)
    }
    
    // Calculate payment
    func paymentOrdinary(futureValue: Double, initialInvestment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = futureValue - initialFutureValue
        let compoundingFactor = (pow(1 + p, period * paymentPerYear) - 1) / p
        return paymentFutureValue / compoundingFactor
    }
    
    // Can't calculate algebraically for annuities with an initial investment. Need to use numerical methods to solve for t.
    func periodOrdinary(futureValue: Double, interest: Double, paymentPerYear: Double,  interestPerYear: Double, payment: Double)-> Double{
        return 0.00
    }
    
    
    // Annuity Due: Payment at the beginning of the month
    
    // Calculate future value
    func futureValueDue (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = self.futureValueOrdinary(initialInvestment: 0, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period) * (1 + p)
        return initialFutureValue + paymentFutureValue
    }
    
    // Calculate present value
    func presentValueDue (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let paymentPresentValue = payment * (1 - pow(1 + p, -period * paymentPerYear)) / p * (1 + p)
        return initialInvestment + paymentPresentValue
    }
    
    // Calculate initial investment
    func initialInvestmentDue(futureValue: Double, payment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let paymentFutureValue = self.futureValueDue(initialInvestment: 0, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        let investmentFutureValue = futureValue - paymentFutureValue
        return InterestCalculation().presentValueCompound(futureValue: investmentFutureValue, interest: interest, period: period, compoundPeriod: interestPerYear)
    }
    
    // calculate payment
    func paymentDue(futureValue: Double, initialInvestment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = futureValue - initialFutureValue
        let compoundingFactor = self.futureValueDue(initialInvestment: 0, payment: 1, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        return paymentFutureValue / compoundingFactor
    }
}

// Annuity Type
enum AnnuityType: String, Identifiable, CaseIterable{
    case ordinary = "End of the month"
    case due = "Start of the month"
    var id: Self {self}
}

// Results that can be calculated from the annuity view
enum AnnuityResultTypes: String, CaseIterable, Identifiable {
    case futureValue = "Future Value"
    case presentValue = "Present Value"
    case initialInvestment = "Initial Investment"
    case payment = "Payment"
    var id: Self { self }
}
