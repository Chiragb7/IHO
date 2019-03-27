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
    
    func addLucy(x: Float = 0, y: Float = -0.02, z: Float = -0.0671) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        addLucy()
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
    
    //-------------------
    //MARK: Node Creation
    //-------------------
    
    /// Creates An SCNNode With An SCNTextGeometry
    ///
    /// - Parameter position: SCNVector3
    func createTextFromPosition(_ position: SCNVector3){
        
        let textNode = SCNNode()
        
        //1. Create The Text Geometry With String & Depth Parameters
        let textGeometry = SCNText(string: "Lucy Body Part" , extrusionDepth: 1)
        
        if let textGeometry = textNode.geometry as? SCNText {
            textGeometry.string = "Evidence for Bipedality: \nThe pelvis is wide and bowl-shaped,\n as it is in humans"
        }
        
        // Setting up the border of the text as a rectangle
        textGeometry.containerFrame = CGRect(origin: .zero, size: CGSize(width: 0.7, height: 2))
        
        // Initializing other properties of the text node like the truncation Mode for the text geometry and
        // the boolean of isWarpped inside a container frame or not
        // and the alignment of the text inside the frame
        textGeometry.truncationMode = kCATruncationNone
        textGeometry.alignmentMode = kCAAlignmentLeft
        textGeometry.isWrapped = true
        
        //2. Set The Font With Our Set Font & Size
        textGeometry.font = UIFont(name: "Times new roman", size: 0.05)
        
        //3. Set The Flatness To Zero (This Makes The Text Look Smoother)
        textGeometry.flatness = 0
        
        //4. Set The Colour Of The Text
        textGeometry.firstMaterial?.diffuse.contents = UIColor.white
        
        //5. Set The Text's Material
        textNode.geometry = textGeometry
        
        //6. Set The Pivot At The Center
        let min = textNode.boundingBox.min
        let max = textNode.boundingBox.max
        
//        textNode.pivot = SCNMatrix4MakeTranslation(
//            min.x + (max.x - min.x)/2,
//            min.y + (max.y - min.y)/2,
//            min.z + (max.z - min.z)/2
//        )
        
//        SCNVector3 min, max;
//        [textNode getBoundingBoxMin:&min max:&max];
//        subnode.position = SCNVector3Make((max.x - min.x) / 2 + min.x, (max.y - min.y) / 2 + min.y, 0);
        
//        let (min, max) = textNode.boundingBox
        
        // Having the text node in the center for the visibility by changing the
        // pivot of the respective geometry
        let dx = min.x + 0.5 * (max.x - min.x)
        let dy = min.y + 0.5 * (max.y - min.y)
        let dz = min.z + 0.5 * (max.z - min.z)
        textNode.pivot = SCNMatrix4MakeTranslation(dx, dy, dz)
        
        //7. Scale The Text So We Can Actually See It!
        textNode.scale = SCNVector3(0.005, 0.005 , 0.005)
        
        //8. Add It To The Hierachy & Position It
        self.sceneView.scene.rootNode.addChildNode(textNode)
        textNode.position = position
        
        //9. Set It As The Current Node
        currentNode = textNode
    }
    
    
    //-------------
    //MARK: Scaling
    //-------------
    
    /// Scales The Currently Selected Node
    ///
    /// - Parameter gesture: UIPinchGestureRecognizer
    @objc func scaleCurrentNode(_ gesture: UIPinchGestureRecognizer) {
        
        if !isRotating, let selectedNode = currentNode{
            
            if gesture.state == .changed {
                
                let pinchScaleX: CGFloat = gesture.scale * CGFloat((selectedNode.scale.x))
                let pinchScaleY: CGFloat = gesture.scale * CGFloat((selectedNode.scale.y))
                let pinchScaleZ: CGFloat = gesture.scale * CGFloat((selectedNode.scale.z))
                selectedNode.scale = SCNVector3Make(Float(pinchScaleX), Float(pinchScaleY), Float(pinchScaleZ))
                gesture.scale = 1
                
            }
            
            if gesture.state == .ended {}
        }
        currentNode?.removeFromParentNode()
    }
}
