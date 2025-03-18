//
//  MortageCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-17.
//

import Foundation

class MortageCalculation{
    
    func mortagePeriod(homePrice: Double,
                       downPayment: Double,
                       payment: Double,
                       interest: Double,
                       paymentPerYear: Double,
                       interestPerYear: Double)-> Double{
        
        return LoanCalculation().loanPeriodOrdinary(loanValue: homePrice - downPayment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear)
    }
    
    func mortageHomePrice(downPayment:Double,
                   payment: Double,
                   interest: Double,
                   paymentPerYear: Double,
                   interestPerYear: Double,
                   period: Double)->Double{
        
        return LoanCalculation().loanValueOrdinary(payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period) + downPayment
    }
    
    func mortagePayment(homePrice: Double,
                        downPayment: Double,
                        interest: Double,
                        paymentPerYear: Double,
                        interestPerYear: Double,
                        period: Double) -> Double {
        
        return LoanCalculation().loanPaymentOrdinary(loanValue: homePrice - downPayment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
    }
    
}

enum MortageResultType: String, CaseIterable, Identifiable {
    case period = "Time Period"
    case homePrice = "Home Price"
    case payment = "Payment"
    var id: Self { self }
}
