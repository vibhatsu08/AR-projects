//
//  ViewController.swift
//  solarSystem1
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
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let mercury = SCNSphere(radius: 0.05)
        let venus = SCNSphere(radius: 0.05)
        let earth = SCNSphere(radius: 0.05)
        let mars = SCNSphere(radius: 0.05)
        let jupiter = SCNSphere(radius: 0.1)
        let saturn = SCNSphere(radius: 0.08)
        let uranus = SCNSphere(radius: 0.06)
        let neptune = SCNSphere(radius: 0.07)
        
        let materialMercury = SCNMaterial()
        let materialVenus = SCNMaterial()
        let materialEarth = SCNMaterial()
        let materialMars = SCNMaterial()
        let materialJupiter = SCNMaterial()
        let materialSaturn = SCNMaterial()
        let materialUranus = SCNMaterial()
        let materialNeptune = SCNMaterial()
        
        materialMercury.diffuse.contents = UIColor.yellow
        materialVenus.diffuse.contents = UIColor.yellow
        materialEarth.diffuse.contents = UIColor.yellow
        materialMars.diffuse.contents = UIColor.yellow
        materialJupiter.diffuse.contents = UIColor.yellow
        materialSaturn.diffuse.contents = UIColor.yellow
        materialUranus.diffuse.contents = UIColor.yellow
        materialNeptune.diffuse.contents = UIColor.yellow
        
        materialMercury.diffuse.contents = UIImage(named: "art.scnassets/2k_mercury.jpg")
        mercury.materials = [materialMercury]

        materialVenus.diffuse.contents = UIImage(named: "art.scnassets/2k_venus_surface.jpg")
        venus.materials = [materialVenus]
        
        materialEarth.diffuse.contents = UIImage(named: "art.scnassets/2k_earth_daymap.jpg")
        earth.materials = [materialEarth]
        
        materialMars.diffuse.contents = UIImage(named: "art.scnassets/2k_mars.jpg")
        mars.materials = [materialMars]
        
        materialJupiter.diffuse.contents = UIImage(named: "art.scnassets/2k_jupiter.jpg")
        jupiter.materials = [materialJupiter]
        
        materialSaturn.diffuse.contents = UIImage(named: "art.scnassets/2k_saturn.jpg")
        saturn.materials = [materialSaturn]
        
        materialUranus.diffuse.contents = UIImage(named: "art.scnassets/2k_uranus.jpg")
        uranus.materials = [materialUranus]
        
        materialNeptune.diffuse.contents = UIImage(named: "art.scnassets/2k_neptune.jpg")
        neptune.materials = [materialNeptune]
        
        let nodeMercury = SCNNode()
        nodeMercury.position = SCNVector3(x: -0.3, y: 0.1, z: -0.5)
        nodeMercury.geometry = mercury
        sceneView.scene.rootNode.addChildNode(nodeMercury)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeVenus = SCNNode()
        nodeVenus.position = SCNVector3(x: -0.1, y: 0.1, z: -0.5)
        nodeVenus.geometry = venus
        sceneView.scene.rootNode.addChildNode(nodeVenus)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeEarth = SCNNode()
        nodeEarth.position = SCNVector3(x: 0.1, y: 0.1, z: -0.5)
        nodeEarth.geometry = earth
        sceneView.scene.rootNode.addChildNode(nodeEarth)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeMars = SCNNode()
        nodeMars.position = SCNVector3(x: 0.3, y: 0.1, z: -0.5)
        nodeMars.geometry = mars
        sceneView.scene.rootNode.addChildNode(nodeMars)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeJupiter = SCNNode()
        nodeJupiter.position = SCNVector3(x: 0.5, y: 0.1, z: -0.5)
        nodeJupiter.geometry = jupiter
        sceneView.scene.rootNode.addChildNode(nodeJupiter)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeSaturn = SCNNode()
        nodeSaturn.position = SCNVector3(x: 0.8, y: 0.1, z: -0.5)
        nodeSaturn.geometry = saturn
        sceneView.scene.rootNode.addChildNode(nodeSaturn)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeUranus = SCNNode()
        nodeUranus.position = SCNVector3(x: 1.0, y: 0.1, z: -0.5)
        nodeUranus.geometry = uranus
        sceneView.scene.rootNode.addChildNode(nodeUranus)
        sceneView.autoenablesDefaultLighting = true
        
        let nodeNeptune = SCNNode()
        nodeNeptune.position = SCNVector3(x: 1.2, y: 0.1, z: -0.5)
        nodeNeptune.geometry = neptune
        sceneView.scene.rootNode.addChildNode(nodeNeptune)
        sceneView.autoenablesDefaultLighting = true
        
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
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
