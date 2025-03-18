//
//  MenuView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-18.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationLink(destination: InterestCalculationView()){
            MenuBoxView(boxText: "Interest Calculator", imageName: "Interest", typeSF: false)
        }
        NavigationLink(destination: AnnuityCalculationView()){
            MenuBoxView(boxText: "Savings Calculator", imageName: "Saving", typeSF: false)
        }
        NavigationLink(destination: LoanCalculationView()){
            MenuBoxView(boxText: "Loan Calculator", imageName: "Loan", typeSF: false)
        }
        NavigationLink(destination: MortgageCalculationView()){
            MenuBoxView(boxText: "Mortgage Calculator", imageName: "Mortgage", typeSF: false)
        }
    }
}

#Preview {
    MenuView()
}
