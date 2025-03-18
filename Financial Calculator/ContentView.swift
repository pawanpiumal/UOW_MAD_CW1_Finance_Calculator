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
    
    
    let gridSpacing: CGFloat = 8
    var body: some View {
        NavigationStack {
            // for vertical view of mobile
            if(verticalSizeClass == .regular){
                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: 1), spacing: gridSpacing) {
                    MenuView()
                }
                .navigationTitle("Financial Calculator")
                .padding()
                .toolbar{
                    ToolbarItem{
                        NavigationLink(destination: HelpView()){
                            Text("Help")
                        }
                    }
                }
            }else{
                // For Horizontal view of mobile
                LazyHGrid(rows: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: 2), spacing: gridSpacing) {
                    MenuView()
                }
                .flipsForRightToLeftLayoutDirection(true)
                .navigationTitle("Financial Calculator")
                .padding()
                .toolbar{
                    ToolbarItem{
                        NavigationLink(destination: HelpView()){
                            Text("Help")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
