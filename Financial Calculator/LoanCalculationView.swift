//
//  LoanCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-16.
//

import SwiftUI

struct LoanCalculationView: View {
    @State private var selectedType: LoanResultType = .period
    
    @State private var loanValue: String = ""
    @State private var interest: String = ""
    @State private var period: String = ""
    @State private var paymentPerYear: String = ""
    @State private var interestPerYear: String = ""
    @State private var payment: String = ""
    
    func clear(){
        loanValue = ""
        interest = ""
        period = ""
        paymentPerYear = ""
        interestPerYear = ""
        payment = ""
    }
    
    func calculate()-> String{
        let loanValue = Double(loanValue) ?? 0.00
        var interest = Double(interest) ?? 0.00
        var period = Double(period) ?? 0.00
        let paymentPerYear = Double(paymentPerYear) ?? 0.00
        let interestPerYear = Double(interestPerYear) ?? 0.00
        let payment = Double(payment) ?? 0.00
        
        interest = interest / 100
        period = period / 12
        
        var result = 0.00
        
        switch(selectedType){
        case .futureValue:
            result = LoanCalculation().loanFutureValueOrdinary(payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        case .loanValue:
            result = LoanCalculation().loanValueOrdinary(payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        case .payment:
            result = LoanCalculation().loanPaymentOrdinary(loanValue: loanValue, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        case .period:
            result = LoanCalculation().loanPeriodOrdinary(loanValue: loanValue, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear)
        }
        
        if(result.isNaN || result.isInfinite){
            result = 0.00
        }
        
        return String(format : "%.2f", result)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Calculate", selection: $selectedType) {
                        ForEach(LoanResultType.allCases){ resultType in
                            Text(resultType.rawValue)
                        }
                    }
                }
                
                Section (header: Text("Input Values")){
                    
                    if(selectedType != .loanValue && selectedType != .futureValue){
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $loanValue)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Loan Value")
                        }
                    }
                    
                    LabeledContent {
                        HStack {
                            TextField("0.00", text: $interest)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            Text("%")
                        }
                    } label: {
                        Text("Annual Interest")
                    }
                    
                    if selectedType != .period{
                        LabeledContent {
                            HStack {
                                TextField("0", text: $period)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("months")
                            }
                        } label: {
                            Text("Time Period")
                        }
                    }
                    
                    if selectedType != .payment{
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $payment)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Payment")
                        }
                    }
                    
                    LabeledContent {
                        HStack {
                            TextField("0", text: $paymentPerYear)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            Text("times")
                        }
                    } label: {
                        Text("Payments per Year")
                    }
                    
                    LabeledContent {
                        HStack {
                            TextField("0", text: $interestPerYear)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            Text("times")
                        }
                    } label: {
                        Text("Interest periods per Year")
                    }
                }
                
                Section{
                    HStack{
                        if selectedType == .period{
                            Text("\(calculate()) months")
                        }else{
                            Text("LKR \(calculate())")
                        }
                    }
                } header: {
                    Text(selectedType.rawValue)
                }
            }
            .navigationTitle(Text("Loan Calculator"))
            .toolbar{
                ToolbarItem{
                    Button("Clear"){
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LoanCalculationView()
}
