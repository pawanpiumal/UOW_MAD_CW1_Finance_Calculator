//
//  AnnuityCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-15.
//

import Foundation

class AnnuityCalculation{
    
    // Ordinary Annuity  - Payment at end of period
    func futureValueOrdinary (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = payment * (pow(1 + p, period * paymentPerYear) - 1) / p
        return initialFutureValue + paymentFutureValue
    }
    
    func presentValueOrdinary (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let paymentPresentValue = payment * (1 - pow(1 + p, -period * paymentPerYear)) / p
        return initialInvestment + paymentPresentValue
    }
    
    func initialInvestmentOrdinary(futureValue: Double, payment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let paymentFutureValue = payment * (pow(1 + p, period * paymentPerYear) - 1) / p
        let investmentFutureValue = futureValue - paymentFutureValue
        return InterestCalculation().presentValueCompound(futureValue: investmentFutureValue, interest: interest, period: period, compoundPeriod: interestPerYear)
    }
    
    func paymentOrdinary(futureValue: Double, initialInvestment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = futureValue - initialFutureValue
        let compoundingFactor = (pow(1 + p, period * paymentPerYear) - 1) / p
        return paymentFutureValue / compoundingFactor
    }
    
    // Annuity Due: Payment at the beginning of the month
    func futureValueDue (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = self.futureValueOrdinary(initialInvestment: 0, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period) * (1 + p)
        return initialFutureValue + paymentFutureValue
    }
    
    func presentValueDue (initialInvestment: Double, payment: Double, interest: Double, paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let c = interestPerYear / paymentPerYear
        let p = (pow(1 + interest/interestPerYear, c) - 1)
        let paymentPresentValue = payment * (1 - pow(1 + p, -period * paymentPerYear)) / p * (1 + p)
        return initialInvestment + paymentPresentValue
    }
    
    func initialInvestmentDue(futureValue: Double, payment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let paymentFutureValue = self.futureValueDue(initialInvestment: 0, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        let investmentFutureValue = futureValue - paymentFutureValue
        return InterestCalculation().presentValueCompound(futureValue: investmentFutureValue, interest: interest, period: period, compoundPeriod: interestPerYear)
    }
    
    func paymentDue(futureValue: Double, initialInvestment: Double, interest: Double,paymentPerYear: Double, interestPerYear: Double, period: Double) -> Double{
        let initialFutureValue = InterestCalculation().futureValueCompound(presentValue: initialInvestment, interest: interest, period: period, compoundPeriod: interestPerYear)
        let paymentFutureValue = futureValue - initialFutureValue
        let compoundingFactor = self.futureValueDue(initialInvestment: 0, payment: 1, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        return paymentFutureValue / compoundingFactor
    }
}

enum AnnuityType: String, Identifiable, CaseIterable{
    case ordinary = "End of the month"
    case due = "Start of the month"
    var id: Self {self}
}

enum AnnuityResultTypes: String, CaseIterable, Identifiable {
    case futureValue = "Future Value"
    case presentValue = "Present Value"
    case initialInvestment = "Initial Investment"
    case payment = "Payment"
    var id: Self { self }
}
