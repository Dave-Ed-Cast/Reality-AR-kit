//
//  ContentView.swift
//  RealityAR
//
//  Created by Davide Castaldi on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        
        //DA VIEW
        VStack {
            
            Image("plane")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.tint)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                .padding(24)
            
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
        
        // 3.
        .fullScreenCover(isPresented: $isPresented, content: {
            SheetView(isPresented: $isPresented)
        })
        
    }
    
}

#Preview {
    ContentView()
}
