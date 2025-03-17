//
//  MortageCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-17.
//

import SwiftUI

struct MortageCalculationView: View {
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
        
    }
    
    func calculate()->String{
        return "1"
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
                        Text("LKR \(calculate())")
                    }
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
