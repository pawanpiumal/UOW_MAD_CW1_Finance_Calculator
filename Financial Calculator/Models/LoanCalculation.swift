//
//  LoanCalculation.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-16.
//
import Foundation

class LoanCalculation{
    
    // Ordinary Annuity  - Payment at end of period
    func loanFutureValueOrdinary(payment: Double,
                                 interest: Double,
                                 paymentPerYear: Double,
                                 interestPerYear: Double,
                                 period: Double) -> Double{
        
        return AnnuityCalculation().futureValueOrdinary(initialInvestment: 0, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
    }
    
    func loanValueOrdinary (payment: Double,
                            interest: Double,
                            paymentPerYear: Double,
                            interestPerYear: Double,
                            period: Double) -> Double{
        
        return AnnuityCalculation().presentValueOrdinary (initialInvestment: 0, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
    }
    
    func loanPaymentOrdinary(loanValue: Double,
                             interest: Double,
                             paymentPerYear: Double,
                             interestPerYear: Double,
                             period: Double)->Double{
        
        let ERR = pow(1 + interest / interestPerYear, interestPerYear / paymentPerYear) - 1
        return loanValue * ERR / (1 - pow(1 + ERR, -period * paymentPerYear))
    }
    
    func loanPeriodOrdinary(loanValue: Double,
                            payment: Double,
                            interest: Double,
                            paymentPerYear: Double,
                            interestPerYear: Double) -> Double{
        
        let ERR = pow(1 + interest / interestPerYear, interestPerYear / paymentPerYear) - 1
        return -log(1 - ERR * loanValue / (payment * (1 + ERR))) / log(1 + ERR)
    }
    
}

enum LoanResultType: String, CaseIterable, Identifiable {
    case period = "Time Period"
    case loanValue = "Loan Value"
    case futureValue = "Future Value"
    case payment = "Payment"
    var id: Self { self }
}
