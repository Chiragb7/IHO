//
//  ViewController.swift
//  IHO
//
//  Created by Desai, Dhruti on 2/19/19.
//  Copyright © 2019 Desai, Dhruti. All rights reserved.
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
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // create a new label on the ARSCNView specific to the 3D model object
        let sceneARLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 500, height: 40))
        
        // setting the different properties of the sceneARLabel
        // set the respective text
        sceneARLabel.text = "Air Plane Label"
        // set the alignment of the label
        sceneARLabel.textAlignment = .left
        // set the font size of the label
        sceneARLabel.font = sceneARLabel.font.withSize(20)
        // set the colour of the label text
        sceneARLabel.textColor = UIColor.white
        
        // adding the Label to the view
        sceneView.addSubview(sceneARLabel)
        
        
        let sceneARButton = UIButton(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        
        // setting the attributes for the sceneARButton
        // set the title for the button
        sceneARButton.setTitle("Touch Model Button", for: .normal)
        // set the color of the title
        sceneARButton.setTitleColor(UIColor.white, for: .normal)
    
        //adding the button to the view
        sceneView.addSubview(sceneARButton)
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
}
