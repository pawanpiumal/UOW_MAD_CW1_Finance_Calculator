//
//  MenuBoxView.swift
//  Financial Calculator
//
//  Created by GPPA on 2025-03-10.
//

import SwiftUI

struct MenuBoxView: View {
    let boxText: String
    let imageName: String
    let typeSF: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 3)
                                        .strokeBorder()
                                        .foregroundColor(.purple)
            HStack(alignment: .center) {
                if typeSF{
                    Image(systemName: imageName)
                        .imageScale(.large)
                        .font(.largeTitle)
                }else{
                    if(colorScheme == .light){
                        Image(imageName)
                            .imageScale(.large)
                            .font(.largeTitle)
                    }else{
                        // White images for Dark Mode
                        Image(imageName+"DM")
                            .imageScale(.large)
                            .font(.largeTitle)
                    }
                }
                
                Text(boxText)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MenuBoxView(boxText: "Example Calculation",imageName: "heart.fill", typeSF: true)
}

#Preview(traits: .sizeThatFitsLayout) {
    MenuBoxView(boxText: "Example Calculation",imageName: "Interest", typeSF: false)
}
