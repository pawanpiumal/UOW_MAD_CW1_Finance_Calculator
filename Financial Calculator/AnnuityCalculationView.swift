//
//  AnnutiyCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-15.
//

import SwiftUI

struct AnnuityCalculationView: View {
    @State private var selectedType: AnnuityType = .ordinary
    @State private var resultType: AnnuityResultTypes = .futureValue
    
    @State private var initialInvestment: String = ""
    @State private var futureValue: String = ""
    @State private var interest: String = ""
    @State private var period: String = ""
    @State private var paymentPerYear: String = ""
    @State private var interestPerYear: String = ""
    @State private var payment: String = ""
    
    func clear(){
        initialInvestment = ""
        futureValue = ""
        interest = ""
        period = ""
        paymentPerYear = ""
        interestPerYear = ""
        payment = ""
    }
    
    func calculate()-> String{
        let initialInvestment = Double(initialInvestment) ?? 0.00
        let futureValue = Double(futureValue) ?? 0.00
        var interest = Double(interest) ?? 0.00
        var period = Double(period) ?? 0.00
        let paymentPerYear = Double(paymentPerYear) ?? 0.00
        let interestPerYear = Double(interestPerYear) ?? 0.00
        let payment = Double(payment) ?? 0.00
        
        interest = interest / 100
        period = period / 12
        
        var result = 0.00
        
        switch(resultType){
        case .futureValue:
            if(selectedType == .ordinary){
                result = AnnuityCalculation().futureValueOrdinary(initialInvestment: initialInvestment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }else{
                result = AnnuityCalculation().futureValueDue(initialInvestment: initialInvestment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }
        case .initialInvestment:
            if selectedType == .ordinary{
                result = AnnuityCalculation().initialInvestmentOrdinary(futureValue: futureValue, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }else{
                result = AnnuityCalculation().initialInvestmentDue(futureValue: futureValue, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }
        case .payment:
            if selectedType == .ordinary{
                result = AnnuityCalculation().paymentOrdinary(futureValue: futureValue, initialInvestment: initialInvestment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }else{
                result = AnnuityCalculation().paymentDue(futureValue: futureValue, initialInvestment: initialInvestment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }
        case .presentValue:
            if selectedType == .ordinary{
                result = AnnuityCalculation().presentValueOrdinary(initialInvestment: initialInvestment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }else{
                result = AnnuityCalculation().presentValueDue(initialInvestment: initialInvestment, payment: payment, interest: interest, paymentPerYear: paymentPerYear, interestPerYear: interestPerYear, period: period)
            }
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
                    Picker("Annuity Type", selection: $selectedType) {
                        ForEach(AnnuityType.allCases){ annuityType in
                            Text(annuityType.rawValue)
                        }
                    }
                    
                    Picker("Calculate", selection: $resultType) {
                        ForEach(AnnuityResultTypes.allCases){ resultType in
                            Text(resultType.rawValue)
                        }
                    }
                }
                
                Section (header: Text("Input Values")){
                    if(resultType != .initialInvestment){
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $initialInvestment)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Initial Investment")
                        }
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
                    
                    if(resultType != .futureValue && resultType != .presentValue){
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $futureValue)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Future Value")
                        }
                    }
                    
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
                        Text("\(calculate()) LKR")
                    }
                } header: {
                    Text(resultType.rawValue)
                }
                
            }
            .navigationTitle(Text("Payment Calculator"))
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
    AnnuityCalculationView()
}
