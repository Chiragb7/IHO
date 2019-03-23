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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/Lucy.scn")!
        //2. Add A UIPinchGestureRecognizer So We Can Scale Our TextNode
        let scaleGesture = UIPinchGestureRecognizer(target: self, action: #selector(scaleCurrentNode(_:)))
        self.view.addGestureRecognizer(scaleGesture)
        
        //3. Add A Tap Gesture Recogizer So We Can Place Our TextNode
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(placeOrAssignNode(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    
    
    func updatePositionAndOrientationOf(_ node: SCNNode, withPosition position: SCNVector3, relativeTo referenceNode: SCNNode) {
        let referenceNodeTransform = matrix_float4x4(referenceNode.transform)
        
        // Setup a translation matrix with the desired position
        var translationMatrix = matrix_identity_float4x4
        translationMatrix.columns.3.x = position.x
        translationMatrix.columns.3.y = position.y
        translationMatrix.columns.3.z = position.z
        
        // Combine the configured translation matrix with the referenceNode's transform to get the desired position AND orientation
        let updatedTransform = matrix_multiply(referenceNodeTransform, translationMatrix)
        node.transform = SCNMatrix4(updatedTransform)
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
 */
    
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
    
    //-----------------------
    //MARK: Touch Interaction
    //-----------------------
    
    /// Performs An ARHitTest Or SCNHitTest So We Can Place Or Assign Our TextNode
    ///
    /// - Parameter gesture: UITapGestureRecognizer
    @objc func placeOrAssignNode(_ gesture: UITapGestureRecognizer){
        
        //1. Get The Current Location Of The Tap
        let currentTouchLocation = gesture.location(in: self.sceneView)
        
        //2. If We Hit An SCNNode Set It As The Current Node So We Can Interact With It
        if let nodeHitTest = self.sceneView.hitTest(currentTouchLocation, options: nil).first?.node{
            
            currentNode = nodeHitTest
            return
        }
        
        //3. Do An ARHitTest For Features Points So We Can Place An SCNNode
        if let hitTest = self.sceneView.hitTest(currentTouchLocation, types: .featurePoint).first {
            
            //4. Get The World Transform
            let hitTestPosition = hitTest.worldTransform.columns.3
            
            //5. Add The TestNode At The Desired Position
            createTextFromPosition(SCNVector3(hitTestPosition.x, hitTestPosition.y, hitTestPosition.z))
            return
            
        }
        currentNode?.removeFromParentNode()
        
    }
}
