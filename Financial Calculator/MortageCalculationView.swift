//
//  MortageCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-17.
//

import SwiftUI

struct MortageCalculationView: View {
    @State private var resultType: MortageResultType = .period

    
    @State private var homePrice: String = ""
    @State private var downPayment: String = ""
    @State private var interest: String = ""
    @State private var period: String = ""
    @State private var paymentPerYear: String = ""
    @State private var interestPerYear: String = ""
    @State private var payment: String = ""
    
    func clear(){
        homePrice = ""
        downPayment = ""
        interest = ""
        period = ""
        paymentPerYear = ""
        interestPerYear = ""
        payment = ""
    }
    
    func calculate()->String{
        let homePrice = Double(homePrice) ?? 0.00
        let downPayment = Double(downPayment) ?? 0.00
        var interest = Double(interest) ?? 0.00
        var period = Double(period) ?? 0.00
        let paymentPerYear = Double(paymentPerYear) ?? 0.00
        let interestPerYear = Double(interestPerYear) ?? 0.00
        let payment = Double(payment) ?? 0.00
        
        interest = interest / 100
        period = period / 12
        
        var result = 0.00
        
        switch(resultType){
        case .homePrice:
            result = MortageCalculation().mortageHomePrice(downPayment: downPayment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        case .payment:
            result = MortageCalculation().mortagePayment(homePrice: homePrice, downPayment: downPayment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
        case .period:
            result = MortageCalculation().mortagePeriod(homePrice: homePrice, downPayment: downPayment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear)
        }
        
        if(result.isInfinite){
            return "Infinite"
        }
        
        if(result.isNaN){
            return "Enter valid inputs"
        }
        if(resultType == .period){
            return String(format : "%.2f", result)+" months"
        }else{
            return String(format : "%.2f", result)
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Calculate", selection: $resultType) {
                        ForEach(MortageResultType.allCases){ resultType in
                            Text(resultType.rawValue)
                        }
                    }
                }
                
                Section (header: Text("Input Values")){
                    if(resultType != .homePrice){
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $homePrice)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Home Price")
                        }
                    }
                    
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $downPayment)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Down Payment")
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
                    
                    if(resultType != .payment){
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
                    
                    if(resultType != .period){
                        LabeledContent {
                            HStack {
                                TextField("0", text: $period)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("months")
                            }
                        } label: {
                            Text("Loan Term")
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
                    Text("\(calculate())")
                } header: {
                    Text(resultType.rawValue)
                }
                
            }
            .navigationTitle(Text("Mortage Calculator"))
            .toolbar{
                ToolbarItem{
                    Button("Clear"){
                        clear()
                    }
                }
            }
        }
    }
}

#Preview {
    MortageCalculationView()
}
