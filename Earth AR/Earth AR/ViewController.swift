//
//  ViewController.swift
//  Earth AR
//
//  Created by Oğuzhan Varsak on 28.05.2022.
//

//usdzconvert saturn.obj -m saturn_MAT -diffuseColor diffuse.png -normal normal.png -roughness roughness.png -m saturn_rings_MAT -diffuseColor diffuseR.png -normal normalR.png -roughness roughnessR.png

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let earthPlaneAnchor = try! FirstScene.loadEarthPlane()
        
        arView.scene.anchors.append(earthPlaneAnchor)
    }
}
