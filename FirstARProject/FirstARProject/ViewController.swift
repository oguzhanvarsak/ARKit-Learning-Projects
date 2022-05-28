//
//  ViewController.swift
//  FirstARProject
//
//  Created by Oğuzhan Varsak on 28.05.2022.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        arView.scene.addAnchor(anchor)
        
        let planeModel = try! Experience.loadPlane()
        
        anchor.addChild(planeModel)
    }
}
