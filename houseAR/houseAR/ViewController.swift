//
//  ViewController.swift
//  houseAR
//
//  Created by Vedant Mistry on 09/01/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        let houseScene = SCNScene(named: "art.scnassets/Cottage_FREE copy.scn")!
        if let houseNode = houseScene.rootNode.childNode(withName: "Cottage_Free", recursively: true){
            houseNode.position = SCNVector3(x: 0, y: 0, z: -1)
            sceneView.scene.rootNode.addChildNode(houseNode)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
