//
//  InterestCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-10.
//

import SwiftUI

struct InterestCalculationView: View {
    @State private var text: String
    
    var body: some View {
        ScrollView{
            TextField("Placeholder", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    InterestCalculationView()
}
