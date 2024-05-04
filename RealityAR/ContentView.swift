//
//  ContentView.swift
//  RealityAR
//
//  Created by Davide Castaldi on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    @State var modelName: String
    var body: some View {
        
        //DA VIEW
        VStack {
            
            //this would work if the image would be declared before picking it from the picker. So yeah this will never work this way.
//            Image("\(modelName)")
            
            Picker(selection: $modelName, label: Text("Choose the model")) {
                Text("Car")
                    .tag("toy_car")
                Text("Guitar")
                    .tag("fender_stratocaster")
            }
            
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "arkit")
                Text("Open AR")
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding(24)
            
            
        }
        .padding()
        
        .fullScreenCover(isPresented: $isPresented, content: {
            SheetView(isPresented: $isPresented, modelName: $modelName)
        })
        
    }
    
}

#Preview {
    ContentView(modelName: "toy_car")
}
