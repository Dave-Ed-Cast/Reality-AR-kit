//
//  SheetView.swift
//  RealityAR
//
//  Created by Davide Castaldi on 03/05/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var isPresented : Bool
    @Binding var modelName : String
    
    
    //A close button is added to the top trailing corner of the view. When tapped, it toggles the isPresented binding to dismiss the sheet. The button is styled using an image of an "xmark.circle" from SF Symbols, with a large title font, black color, and a circular shape. It also has a background of .ultraThinMaterial to provide a subtle visual effect. Padding is applied to ensure proper spacing around the button.
    
    var body: some View {
        //the ZStack overlays the AR view with a close button. Inside the ZStack the ARViewContainer is presented using the modelName state variable.
        ZStack(alignment: .topTrailing) {

            ARViewContainer(modelName: $modelName)
                .ignoresSafeArea(edges: .all)

            //A close button is added to toggle dismiss the view sheet.
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
    SheetView(isPresented: .constant(true), modelName: .constant("toy_car"))
}
