//
//  ViewController.swift
//  IHO
//
//  Created by vkasam on 3/22/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    //2. Create Our ARWorld Tracking Configuration
    let configuration = ARWorldTrackingConfiguration()
    
    //3. Create Our Session
    let augmentedRealitySession = ARSession()
    
    //4. Create A Variable To Store The Current Nodes Rotation Around It's Y-Axis
    var currentAngleY: Float = 0.0
    var isRotating = false
    var currentNode: SCNNode?
    @IBOutlet var infoLabel: UILabel!
    
    func addLucy(x: Float = 0, y: Float = 0, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/Lucy.scn") else { return }
        let LucyNode = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            LucyNode.addChildNode(childNode)
        }
        LucyNode.position = SCNVector3(x, y, z)
        LucyNode.scale = SCNVector3(0.002, 0.002, 0.002)
        sceneView.scene.rootNode.addChildNode(LucyNode)
    }
    
    func addButtonRF(x: Float = -0.09, y: Float = -0.1, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNode = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "rightLeg"
            LucyNode.addChildNode(childNode)
        }
        LucyNode.position = SCNVector3(x, y, z)
        LucyNode.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNode)
    }
    
    func addButtonRL(x: Float = -0.07, y: Float = -0.25, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNode = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "rightFeet"
            LucyNode.addChildNode(childNode)
        }
        LucyNode.position = SCNVector3(x, y, z)
        LucyNode.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNode)
    }
    
    func addButtonPalm(x: Float = 0.099, y: Float = 0.08, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "leftFingers"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonHand(x: Float = -0.06, y: Float = 0.08, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "leftHand"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonRBone(x: Float = -0.12, y: Float = -0.04, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "rightHip"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonMidd(x: Float = -0.14, y: Float = -0.01, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "spine"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonLLeft(x: Float = -0.2, y: Float = -0.18, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "leftLegBone"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonLHand(x: Float = -0.2, y: Float = 0.085, z: Float = 0) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "rightHand"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonLSkull(x: Float = -0.13, y: Float = 0.085, z: Float = 0.025) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "lowerJaw"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.009, 0.009, 0.009)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    func addButtonHSkull(x: Float = -0.13, y: Float = 0.137, z: Float = 0.025) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = "skull"
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(0.006, 0.006, 0.006)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        addLucy()
        addButtonRF()
        addButtonRL()
        addButtonPalm()
        addButtonHand()
        addButtonRBone()
        addButtonMidd()
        addButtonLLeft()
        addButtonLHand()
        addButtonLSkull()
        addButtonHSkull()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        guard let touchLocation = touches.first?.location(in: sceneView),
            let hitNode = sceneView?.hitTest(touchLocation, options: nil).first?.node,
            let nodeName = hitNode.name
            else{
                return
        }
        print(nodeName)
        var msg = ""
        //Adding alert to display the text.
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
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
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera:ARCamera, didFailWithError error: Error) {
        switch camera.trackingState {
        case .normal :
            infoLabel.text = "Move the device to detect horizontal surfaces."
            
        case .notAvailable:
            infoLabel.text = "Tracking not available."
            
        case .limited(.excessiveMotion):
            infoLabel.text = "Tracking limited - Move the device more slowly."
            
        case .limited(.insufficientFeatures):
            infoLabel.text = "Tracking limited - Point the device at an area with visible surface detail."
            
        case .limited(.initializing):
            infoLabel.text = "Initializing AR session."
            
        default:
            infoLabel.text = ""
        }
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        infoLabel.text = "Session was interrupted"
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        infoLabel.text = "Session interruption ended"
        resetTracking()
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func resetTracking() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
 
}
