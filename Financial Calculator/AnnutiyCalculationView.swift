//
//  AnnutiyCalculationView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-15.
//

import SwiftUI

struct AnnutiyCalculationView: View {
    @State private var selectedType = "ss"
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                    }
                }
            }
        }
    }
}

#Preview {
    AnnutiyCalculationView()
}
