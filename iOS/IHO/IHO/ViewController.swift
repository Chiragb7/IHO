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


class ViewController: UIViewController, ARSCNViewDelegate{
    
    @IBOutlet var sceneView: ARSCNView!
    //Create Our ARWorld Tracking Configuration
    let configuration = ARWorldTrackingConfiguration()
    
    //Create Our Session
    let augmentedRealitySession = ARSession()
    
    @IBOutlet var infoLabel: UILabel!
    
       @objc func addLucy(x: Float = 0, y: Float = 0, z: Float = 0) {

        
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
    
    func configureLighting(){
        
    sceneView.autoenablesDefaultLighting = true
    sceneView.automaticallyUpdatesLighting = true
    
    }
    
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.addLucy(x:y:z:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func addButton(boneName: String, x: Float, y: Float, z: Float, sx: Float, sy: Float, sz: Float) {
        guard let LucyScene = SCNScene(named: "art.scnassets/button/button.scn") else { return }
        let LucyNodeH = SCNNode()
        let LucySceneChildNodes = LucyScene.rootNode.childNodes
        
        for childNode in LucySceneChildNodes {
            childNode.name = boneName
            LucyNodeH.addChildNode(childNode)
        }
        LucyNodeH.position = SCNVector3(x, y, z)
        LucyNodeH.scale = SCNVector3(sx, sy, sz)
        sceneView.scene.rootNode.addChildNode(LucyNodeH)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        addTapGestureToSceneView()
        configureLighting()
        addLucy()
        
        addButton(boneName: "rightLeg", x: -0.1, y: -0.1, z: -0.001, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "rightFeet", x: -0.07, y: -0.26, z: 0.02, sx: 0.006, sy: 0.01, sz: 0.006)
        addButton(boneName: "rightFingers", x: 0.095, y: 0.08, z: 0, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "rightHand", x: -0.06, y: 0.08, z: 0, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "rightHip", x: -0.11, y: -0.04, z: 0, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "spine", x: -0.146, y: -0.01, z: 0, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "leftLegBone", x: -0.21, y: -0.18, z: 0, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "leftHand", x: -0.2, y: 0.085, z: 0, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Jaw", x: -0.15, y: 0.085, z: 0.02, sx: 0.006, sy: 0.006, sz: 0.009)
        addButton(boneName: "Face", x: -0.16, y: 0.11, z: 0.02, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Brain", x: -0.15, y: 0.142, z: 0.01, sx: 0.006, sy: 0.006, sz: 0.006)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        guard let touchLocation = touches.first?.location(in: sceneView),
            let hitNode = sceneView?.hitTest(touchLocation, options: nil).first?.node,
            let nodeName = hitNode.name
            else{
                return
        }
        
        // Create an object for the class "popUpMessages" swift class
        let popUpMessage = popUpMessages()
        
        //Creating font size and Color of the text of the popUp message
        //The respective text is obtained by calling the dictionary "popUpDict" of class "popUpMessages" using the object created
        
        let attributedString = NSAttributedString(string: popUpMessage.popUpDict[nodeName]!, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.white
            ])
        
        //Creating font size and Color of the text of the popUp title
        //The respective text is obtained by calling the dictionary "popUpTitle" of class "popUpMessages" using the object created
        let attributedTitle = NSAttributedString(string: popUpMessage.popUpTitle[nodeName]!, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24),
            NSAttributedString.Key.foregroundColor : UIColor.white,
            //NSAttributedString.Key.underlineStyle : UIStyle
            ])

        // Adding alert to display the popUpText
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        //Setting the different attributed styles for the Message and the Title of PopUp
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        alert.setValue(attributedString, forKey: "attributedMessage")
        
        // Display the Alert and close accordingly
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
        //Change the default background color of the pop up to Black
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = 0.5
        subview.backgroundColor = UIColor.black
        
        //Change the color of the button "Close" to white
        alert.view.tintColor = UIColor.white
        
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11, *){
           // open 2D view
        }
        else
        {
            let alertController = UIAlertController(title: "IOS Version", message: "SORRY!!Your IOS version is not compatible with Augmented Reality Feature", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
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
