//
//  ViewController.swift
//  ARDicee
//
//  Created by Vedant Mistry on 08/01/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        let sphere = SCNSphere(radius: 0.1)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "art.scnassets/8k_mars.jpg")
//        sphere.materials = [material]
//
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)//this is a 3d vector
//        node.geometry = sphere
//        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
//        let diceScene = SCNScene(named: "art.scnassets/diceCollada copy.scn")!
//        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
//        diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
//        sceneView.scene.rootNode.addChildNode(diceNode)
//        }
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            let planeAnchor = anchor as! ARPlaneAnchor //set the plane anchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z)) //set the plane
            let planeNode = SCNNode() //setting the plane node
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.y) //setting the plane position
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1 , 0, 0)
            let gridMaterials = SCNMaterial() //transforming the position of the plane
            gridMaterials.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            plane.materials = [gridMaterials] //adjusting the source for the image and material
            planeNode.geometry = plane //adjusting the geometry of the plane node
            node.addChildNode(planeNode) //adding the child node to the main node
            
        }
        else {
            return
        }
    }
}
