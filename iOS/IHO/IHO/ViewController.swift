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
import WebKit


class ViewController: UIViewController, ARSCNViewDelegate, WKUIDelegate, WKNavigationDelegate{
   
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet var sceneView: ARSCNView!
    var htmlpath: String? = nil
    //Create Our ARWorld Tracking Configuration
    let configuration = ARWorldTrackingConfiguration()
    //Create Our Session
    let augmentedRealitySession = ARSession()
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet weak var twoDLucyView: WKWebView!
  
    func addLucy(x: Float = 0.05, y: Float = 0, z: Float = -0.4) {
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
        //addTapGestureToSceneView()
        configureLighting()
        addLucy()
        addButton(boneName: "Thigh", x: -0.051, y: -0.1, z: -0.406, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Foot", x: -0.024, y: -0.25, z: -0.37, sx: 0.006, sy: 0.01, sz: 0.006)
        addButton(boneName: "Hand", x: -0.33, y: 0.085, z: -0.4, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Right Arm", x: -0.015, y: 0.085, z: -0.41, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Pelvis", x: -0.068, y: -0.04, z: -0.4, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Spine", x: -0.1, y: -0.01, z: -0.4, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Knee", x: -0.16, y: -0.16, z: -0.4, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Left Arm", x: -0.2, y: 0.085, z: -0.41, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Jaw", x: -0.1, y: 0.085, z: -0.37, sx: 0.006, sy: 0.006, sz: 0.009)
        addButton(boneName: "Face", x: -0.1, y: 0.11, z: -0.37, sx: 0.006, sy: 0.006, sz: 0.006)
        addButton(boneName: "Skull", x: -0.1, y: 0.148, z: -0.4, sx: 0.006, sy: 0.006, sz: 0.006)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touchLocation = touches.first?.location(in: sceneView),
            let hitNode = sceneView?.hitTest(touchLocation, options: nil).first?.node,
            let nodeName = hitNode.name
        else {
                return
        }
        let popUpMessage = popUpMessages()
        
        // Adding alert to display the popUpText
      let alert = UIAlertController(title: popUpMessage.popUpTitle[nodeName]!, message: popUpMessage.popUpDict[nodeName]!, preferredStyle: .alert)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11, *){
            webview.isHidden = true
            sceneView.isHidden = false
        }
        else
        {
            webview.isHidden = false
            sceneView.isHidden = true
            htmlpath = Bundle.main.path(forResource: "lucy", ofType: "html")
            let html = try? String(contentsOfFile: htmlpath!, encoding: String.Encoding.utf8)
            let baseURL = URL(fileURLWithPath: "\(Bundle.main.bundlePath)")
            self.webview.scalesPageToFit = false
            self.webview.loadHTMLString(html!, baseURL: baseURL)
            self.webview.scrollView.isScrollEnabled = true
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
 

