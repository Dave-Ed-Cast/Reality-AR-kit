//
//  ARViewContainer.swift
//  RealityAR
//
//  Created by Davide Castaldi on 03/05/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelName: String
    
    //an ARView instance is created and configured with ARWorldTrackingConfiguration, that tracks the position of a device in relation to objects in the environment.
    //MARK: IT IS IMPERATIVE THAT IT CONFORMS TO UIViewRepresentable! Otherwise we cannot use this container in the view!
    //This enables horizontal and vertical plane detection and after setting the environment to automatic, the AR session is started.
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal,.vertical]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
        return arView
    }
    
    //this updates the view, in which the AR content is also updated. AnchorEntity is created for the content hierarchy. Anchor entities control how to place virtual objects into your scene. It means that if you want to change the position, you have to go in makeUIView
    func updateUIView(_ uiView: ARView, context: Context) {
        
        let anchorEntity = AnchorEntity(world: .zero)
        
        guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
        
        anchorEntity.addChild(modelEntity)
        
        uiView.scene.addAnchor(anchorEntity)
    }
}

#Preview {
    ARViewContainer(modelName: .constant("toy_car"))
}
