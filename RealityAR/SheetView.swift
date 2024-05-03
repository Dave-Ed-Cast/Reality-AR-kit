//
//  SheetView.swift
//  RealityAR
//
//  Created by Davide Castaldi on 03/05/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var isPresented : Bool
    @State var modelName : String = "toy_car"
    
    var body: some View {
        // 1.
        ZStack(alignment: .topTrailing) {

            ARViewContainer(modelName: $modelName)
                .ignoresSafeArea(edges: .all)

            // 2.
            Button() {
                isPresented.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(24)
        }
    }
}

#Preview {
    SheetView(isPresented: .constant(true))
}
