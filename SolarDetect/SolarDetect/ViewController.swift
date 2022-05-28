//
//  ViewController.swift
//  SolarDetect
//
//  Created by Brian Advent on 23.09.19.
//  Copyright © 2019 Brian Advent. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SolarSystem.loadSceneAsync { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let solarSystem):
                self?.arView.scene.anchors.append(solarSystem)
            }
        }
        
    }
}
