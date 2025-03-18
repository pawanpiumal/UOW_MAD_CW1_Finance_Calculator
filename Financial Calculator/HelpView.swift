//
//  HelpView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-18.
//

import SwiftUI
import SwiftMath

struct HelpView: View {
    
    func boldText(_ text: String)->Text{
        return Text(text).fontWeight(.bold)
    }
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Getting Started")){
                    Text("Welcome to the Financial Calculator! This tool helps you plan and manage your finances by calculating savings, investments, loans, and mortgages. Below is a breakdown of each calculator and how to use it.")
                    
                }
                Section(header: Text("Interest Calculator")){
                    VStack(alignment: .leading) {
                        Text("The Interest Calculator helps you to calculate basic financial calculations such as future value, present value, interest, and time with simple or compounding interest.")
                        
                        Text("\nHow to use")
                            .font(.title)
                        Text("\(boldText("Calculate")): Select the parameter you need to find.")
                        Text("\(boldText("Interest Type")): Select simple or compounding interest.")
                        
                        Text("\nInput Values")
                            .font(.title)
                        Text("\(boldText("Initial Investment(PV)")): Present value or the Starting amount")
                        Text("\(boldText("Annual Interest(i)")): Interest per year.")
                        Text("\(boldText("Time Period(t)")): The time in months")
                        Text("\(boldText("Compounds per Year(m)")): Number of compoundings per year. (Only for compounding interest calculations.")
                        Text("\(boldText("Future Value(FV)")): Value of the initial investment after the time period.")
                        
                        Text("\nOutput Values")
                            .font(.title)
                        
                        Text("\(boldText("Future Value(FV)")):")
                        Text("For simple interest,")
                            .font(.callout)
                        MathView(equation:"FV = PV(1+it)")
                        Text("For compound interest,")
                            .font(.callout)
                        MathView(equation:"FV = PV(1+i/m)^{mt}")
                        
                        Text("\(boldText("Present Value(PV)")):")
                        Text("For simple interest,")
                            .font(.callout)
                        MathView(equation:"PV = \\frac{FV}{(1+it)}")
                        Text("For compound interest,")
                            .font(.callout)
                        MathView(equation:"PV = \\frac{FV}{(1+i/m)^{mt}}")
                        
                        Text("\(boldText("Interest (i)")):")
                        Text("For simple interest,")
                            .font(.callout)
                        MathView(equation:"i = {(\\frac{FV-PV}{PVt})} 100\\%")
                        Text("For compound interest,")
                            .font(.callout)
                        MathView(equation:"i = m({(\\frac{FV}{PV})^\\frac{1}{mt}-1})100\\%")
                        
                        Text("\(boldText("Time Period (t)")):")
                        Text("For simple interest,")
                            .font(.callout)
                        MathView(equation:"t = \\frac{FV-PV}{iPV}")
                        Text("For compound interest,")
                            .font(.callout)
                        MathView(equation:"t = \\frac{log(FV/PV)}{m\\cdot log(1+i/m)}")
                    }
                }
                
                Section(header: Text("Savings Calculator")){
                    VStack{
                        Text("The Savings Calculator helps you determine how much your savings will grow over time based on regular contributions, interest rates, and compounding frequency.")
                    }
                }
            }
        }
        .navigationTitle(Text("Help"))
    }
}

#Preview {
    HelpView()
}
