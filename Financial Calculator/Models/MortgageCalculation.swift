//
//  MortgageCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-17.
//

import Foundation

class MortgageCalculation{
    
    // calculate mortgage period
    func mortgagePeriod(homePrice: Double,
                       downPayment: Double,
                       payment: Double,
                       interest: Double,
                       paymentPerYear: Double,
                       interestPerYear: Double)-> Double{
        
        return LoanCalculation().loanPeriodOrdinary(loanValue: homePrice - downPayment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear)
    }
    
    // calculate home price (annuity present value, loan present value)
    func mortgageHomePrice(downPayment:Double,
                   payment: Double,
                   interest: Double,
                   paymentPerYear: Double,
                   interestPerYear: Double,
                   period: Double)->Double{
        
        return LoanCalculation().loanValueOrdinary(payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period) + downPayment
    }
    
    // calculate payment
    func mortgagePayment(homePrice: Double,
                        downPayment: Double,
                        interest: Double,
                        paymentPerYear: Double,
                        interestPerYear: Double,
                        period: Double) -> Double {
        
        return LoanCalculation().loanPaymentOrdinary(loanValue: homePrice - downPayment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
    }
    
}

// results from the mortgage screen
enum MortgageResultType: String, CaseIterable, Identifiable {
    case period = "Time Period"
    case homePrice = "Home Price"
    case payment = "Payment"
    var id: Self { self }
}
