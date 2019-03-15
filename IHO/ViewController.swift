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

struct FossilInfo {
    let name: String
    let image: UIImage
    let information: String
}

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var fossilImage : FossilInfo?
    
    let images = ["lucy" : FossilInfo(name: "Lucy", image: UIImage(named: "art.scnassets/ship.scn")!, information: "IHO has replicas of Lucy‘s bones, which were produced in the Institute‘s casting and molding laboratories. The “real” Lucy is stored in a specially constructed safe in the Paleoanthropology Laboratories of the National Museum of Ethiopia in Addis Ababa, Ethiopia.")]
    
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
        
        //to enable pop on click of a button
        let testButton = UIButton(frame: CGRect(x:10, y:10, width:150, height:10))
        testButton.setTitle("test", for: .normal)
        testButton.setTitleColor(UIColor.red, for: .normal)
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    /*func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageLucy = anchor as? ARImageAnchor else { return
            <#statements#>
        }
        _ = imageLucy.referenceImage;
        
        let planeGeometry = SCNPlane(width: 50, height: 50)
        let material = SCNMaterial()
        
        material.diffuse.contents = UIColor.white
        
        let planeNode = SCNNode(geometry: planeGeometry)
        
        planeNode.geometry?.firstMaterial = material
        
        planeNode.name = "I am a part of Lucy"
        
    }*/
    
    //Function to render the information box
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        if let imageAnchor = anchor as? ARImageAnchor,
            let referenceImageName = imageAnchor.referenceImage.name
        
        {
            self.performSegue(withIdentifier: "displayImageInformation", sender: self)
        }
        
        return nil
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
}
