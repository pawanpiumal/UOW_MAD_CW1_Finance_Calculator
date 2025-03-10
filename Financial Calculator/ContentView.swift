//
//  ContentView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-10.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    
    let gridSpacing: CGFloat = 16
    var body: some View {
        if(verticalSizeClass == .regular){
            NavigationStack {
                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: 2), spacing: gridSpacing) {
                    MenuBoxView(boxText: "Interest Calculation", imageName: "Interest", typeSF: false)
                    MenuBoxView(boxText: "Interest Calculation", imageName: "heart.fill", typeSF: true)
                    MenuBoxView(boxText: "Interest Calculation", imageName: "heart.fill", typeSF: true)
                    MenuBoxView(boxText: "Interest Calculation", imageName: "heart.fill", typeSF: true)
                }
                .navigationTitle("Financial Calculator")
            }
            .padding()
        }else{
            NavigationStack {
                LazyHGrid(rows: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: 2), spacing: gridSpacing) {
                    MenuBoxView(boxText: "Interest Calculation", imageName: "heart.fill", typeSF: true)
                    MenuBoxView(boxText: "Interest Calculation", imageName: "heart.fill", typeSF: true)
                    MenuBoxView(boxText: "Interest Calculation", imageName: "heart.fill", typeSF: true)
                    
                }
                .flipsForRightToLeftLayoutDirection(true)
                .navigationTitle("Financial Calculator")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
