//
//  ViewController.swift
//  PlanetDetect
//
//  Created by Brian Advent on 21.09.19.
//  Copyright © 2019 Brian Advent. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var sun: Experience.Sun!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = "Tap the sun for more information"
        
        loadPlanets()
    }
  
    func loadPlanets() {
        Experience.loadSunAsync(completion: { [weak self] result in
            switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let sun):
                    self?.arView.scene.anchors.append(sun)
                    
                    self?.sun = sun
                    
                    let sunInfoAction = sun.actions.allActions.filter({
                        $0.identifier == "SUNTAP"
                    }).first
                    
                    sunInfoAction?.onAction = { entity in
                        self?.displayInfo()
                    }
            }
        })
        
        Experience.loadEarthAsync(completion: { [weak self] result in
            switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let earth):
                    self?.arView.scene.anchors.append(earth)
            }
        })
    }
    
    @IBAction func getSunInfo(_ sender: Any) {
        sun.notifications.showInfo.post()
    }
    
    func displayInfo (){
        DispatchQueue.main.async {
            self.infoLabel.text = "The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, with internal convective motion that generates a magnetic field via a dynamo process."
        }
    }
}
