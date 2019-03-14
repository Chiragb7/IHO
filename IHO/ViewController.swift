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

class ViewController: UIViewController, ARSCNViewDelegate, UITextFieldDelegate{

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var sceneARButton: UIButton!
    var popUp: UIView!
    
    //the click action listener for the touch model button
    @IBAction func modelButtonClick(_ sender: AnyObject){
        
        //let button_label = sceneARButton.attributedTitle(for: UIControl.State.normal)?.string
        let button_label = sender.currentTitle!
        
        // print that the button is pressed when the title pof the button touched on the app is "Touch Model Button"
        if button_label == "Touch Model Button"
        {
            print("The Touch Model Button is pressed")
            sceneARButton.setTitle("View Lucy Information", for: UIControl.State.selected)
            sceneARButton.backgroundColor = UIColor.red
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding the debugging options to our scene
        //displays the world origin that the image is placed in the scene
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        
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
        
        
        let sceneARButton = UIButton(frame: CGRect(x: 80, y: 80, width: 200, height: 50))
        
        // setting the attributes for the sceneARButton
        // set the title for the button
        sceneARButton.setTitle("Touch Model Button", for: .normal)
        // set the color of the title
        sceneARButton.setTitleColor(UIColor.white, for: .normal)
        // setting the radius of the button's border
        sceneARButton.layer.cornerRadius = 10
        // setting the width of the border
        sceneARButton.layer.borderWidth = 1
        // setting up the color of the border
        sceneARButton.layer.borderColor = UIColor.white.cgColor
        
        sceneARButton.addTarget(self, action: #selector(modelButtonClick), for: .touchUpInside)
        
    
        //adding the button to the view
        sceneView.addSubview(sceneARButton)
        
        //adding the popup to the view
//        self.view.addSubview(popUp)
        
//        sceneView.addSubview(popUp)
        showPopUp()
        
        //adding a tap object to the AR Scene View to display the popup
        //when an object is tapped the function displaypopUp is called to display the popUp Dialog box
        let tap = UITapGestureRecognizer(target: self, action: #selector(displaypopUp(recognizer:)))
        
        //adding the recognizer to the AR scene view
        sceneView.addGestureRecognizer(tap)
        
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    func showPopUp(){
        // setting up the popUpview
        popUp  = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        
        //create a popup label to be displayed on the popup
        let popLabel = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        //set the text of the label
        popLabel.text = "Lucy Body Parts"
        
        //set the background color of the popup
        popUp.backgroundColor = UIColor.white
        
        //add the pop up to the sceneview and the label to the popup
        sceneView.addSubview(popUp)
        popUp.addSubview(popLabel)
        
        //make sure that the centers match of the pop up and the label
        popLabel.center = popUp.center
        
        // set the timer for the popup to be dispalyed on the view
        //Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.cancelpopUp), userInfo: "Lucy Information", repeats: false)
    }
    
    // a Objective C function to dismiss the popup from the super view of the app when timer is done
    @objc func cancelpopUp(){
        if popUp != nil {
            // we can remove the alert after the timer goes off
            popUp.removeFromSuperview()
        }
        
        //calling the created custom POPUP View from the sceneview
        let popUp_mode = popUpDialog(title: "The information regarding Lucy parts go here")
        //calling the show_popup() created in the Modal for popup "popModal.swift"
        popUp_mode.show_popup()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        //var the_textField: UITextField?
        
//        let popUpMessage = UIAlertController(title: "PopupMessage", message: "The information about Lucy can be found here", preferredStyle: .alert)
//
//        let ok_button = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!)  in
//            print("The OK button is pressed");
//
//        }
//        popUpMessage.addAction(ok_button)
//
//        let exit_button = UIAlertAction(title: "EXIT", style: .default) { (action: UIAlertAction!) in
//            print("The EXIT button is pressed");
//
//        }
//
//        popUpMessage.addAction(exit_button)
//
////        popUpMessage.addTextField  { (textField) -> Void in
////            the_textField = textField
////        }
////
//        self.present(popUpMessage, animated: true, completion: nil)
        
    }
    
    func onClick(_ sender: AnyObject?){
        
        if sender === sceneARButton {
            
            sceneARButton.setTitle("Viewing Lucy Info.", for: .normal)
        }
    }
    
    @objc func displaypopUp(recognizer: UITapGestureRecognizer){
        
        if recognizer.state == .ended  {
            //get the tapped location - where the node is tapped on the screen
            //here Lucy - the body part that is tapped on the scene view
            let tapped_location: CGPoint = recognizer.location(in: sceneView)
            //get the value for the number of taps on the same body part of Lucy
            // to determine if we could show the respective information in a PopUp Dialog
            let taps = self.sceneView?.hitTest(tapped_location, options: nil)
            if !taps!.isEmpty{
                //show the popup of the location if the number of taps is >1
                showPopUp()
                //let tappedSCNNode = taps.first?.node
            }
        }
    }
    
    
    
    
}
