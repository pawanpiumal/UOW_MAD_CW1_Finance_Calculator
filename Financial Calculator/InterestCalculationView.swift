//
//  InterestCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-10.
//

import SwiftUI
struct InterestCalculationView: View {
    @State private var selectedType: SavingTypes = .futureValue
    @State private var selectedInterest: InterestType = .compound
    
    @State private var presentValue: String = ""
    @State private var futureValue: String = ""
    @State private var period: String = ""
    @State private var interest: String = ""
    @State private var compoundPeriod: String = "1"
    
    @State private var result: Double = 0.00
    
    func clear(){
        presentValue = ""
        futureValue = ""
        period = ""
        interest = ""
        compoundPeriod = "1"
    }
    
    func calculate()-> String{
        let presentValue =  Double(presentValue) ?? 0.00
        let futureValue =  Double(futureValue) ?? 0.00
        var interest =  Double(interest) ?? 0.00
        var period =  Double(period) ?? 0.00
        let compoundPeriod =  Double(compoundPeriod) ?? 0.00
        
        period = period / 12
        interest = interest / 100
        
        var result = 0.00
        
        switch(selectedType){
        case .futureValue:
            if selectedInterest == .simple{
                result = InterestCalculation().futureValueSimple(presentValue: presentValue, interest: interest, period: period)
            }else {
                result = InterestCalculation().futureValueCompound(presentValue: presentValue, interest: interest, period: period, compoundPeriod: compoundPeriod)
            }
        case .presentValue:
            if selectedInterest == .simple{
                result = InterestCalculation().presentValueSimple(futureValue: futureValue, interest: interest, period: period)
            } else{
                result = InterestCalculation().presentValueCompound(futureValue: futureValue, interest: interest, period: period, compoundPeriod: compoundPeriod)
            }
        case .interest:
            if selectedInterest == .simple{
                result = InterestCalculation().simpleInterest(presentValue: presentValue, futureValue: futureValue, period: period)
            } else {
                result = InterestCalculation().compoundInterest(presentValue: presentValue, futureValue: futureValue, period: period, compoundPeriod: compoundPeriod)
            }
        case .period:
            if selectedInterest == .simple{
                result  = InterestCalculation().periodSimple(presentValue: presentValue, futureValue: futureValue, interest: interest)
            }else{
                result = InterestCalculation().periodCompound(presentValue: presentValue, futureValue: futureValue, interest: interest, compoundPeriod: compoundPeriod)
            }
        }
        
        if (result.isNaN || result.isInfinite) {
            result = 0.0;
        }
        return String(format : "%.2f", result)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Calculate", selection: $selectedType) {
                        ForEach(SavingTypes.allCases){ savingType in
                            Text(savingType.rawValue)
                        }
                    }
                    
                    Picker("Interest Type", selection: $selectedInterest){
                        ForEach(InterestType.allCases){ interest in
                            Text("\(interest.rawValue.capitalized) Interest")
                        }
                    }
                }
                

                Section (header: Text("Input Values")){
                    if(selectedType != .presentValue){
                        LabeledContent {
                            HStack {
                                TextField("0.00", text: $presentValue)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("LKR")
                            }
                        } label: {
                            Text("Initial Investment")
                        }
                    }
                    
                    if(selectedType != .interest){
                        LabeledContent {
                            HStack {
                                TextField("0", text: $interest)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("%")
                            }
                        } label: {
                            Text("Annual Interest")
                        }
                    }
                    
                    if(selectedType != .period){
                        LabeledContent {
                            HStack {
                                TextField("0", text: $period)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("Months")
                            }
                        } label: {
                            Text("Time Period")
                        }
                    }
                    
                    if(selectedInterest == .compound){
                        LabeledContent {
                            HStack {
                                TextField("0", text: $compoundPeriod)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                Text("Times")
                            }
                        } label: {
                            Text("Compounds per Year")
                        }
                    }
                    
                    if(selectedType != .futureValue){
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
                }
                
                Section{
                    HStack{
                        Text(calculate())
                        switch(selectedType){
                        case .futureValue, .presentValue:
                                Text("LKR")
                        case .period:
                                Text("Months")
                        case .interest:
                                Text("%")
                        }
                    }
                    
                } header: {
                    Text(selectedType.rawValue)
                }
            }
            .navigationTitle(Text("Savings Calculator"))
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
    InterestCalculationView()
}
