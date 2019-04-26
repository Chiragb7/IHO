//
//  popUpMesages.swift
//  IHO
//
//  Created by vkasam on 4/9/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import Foundation

public class popUpMessages {
    
    //Creating an empty dictionary for the popup messages
    var popUpDict: [String: String] = [:]
    
    //creating an empty dictionary for the titles corresponding to the popup titles
    var popUpTitle: [String: String] = [:]
    
    init() {
        
        //adding key-value pairs into the dictionary with the bone name as the key and the popUp title as the value
        
        popUpTitle.updateValue("Foot", forKey: "Foot")
        popUpTitle.updateValue("Thigh", forKey: "Thigh")
        popUpTitle.updateValue("Hand", forKey: "Hand")
        popUpTitle.updateValue("Knee", forKey: "Knee")
        popUpTitle.updateValue("Pelvis", forKey: "Pelvis")
        popUpTitle.updateValue("Left Arm", forKey: "Left Arm")
        popUpTitle.updateValue("Spine", forKey: "Spine")
        popUpTitle.updateValue("Right Arm", forKey: "Right Arm")
        popUpTitle.updateValue("Jaw", forKey: "Jaw")
        popUpTitle.updateValue("Skull", forKey: "Skull")
        popUpTitle.updateValue("Face", forKey: "Face")
        
        //adding key-value pairs into the dictionary with the bone name as the key and the popUp message as the value
        
        popUpDict.updateValue("Evidence for bipedality: The long bones of the foot in Australopithecus indicate that they had a human like longitudinal arc.", forKey: "Foot")
        popUpDict.updateValue("Humans walk on two legs (bipedally) and have long legs and short arms. Chimpanzees walk on all fours and have longer arms than legs. Australopithecus are thought to have walked bipedally and had arms that are relatively shorter than chimpanzees but are relatively longer than humans.", forKey: "Thigh")
        popUpDict.updateValue("There is a controversial evidence for Australopithecus stone tool use. The oldest stone tool has been dated to 2.6 million years ago. It is possible that they were either using naturally broken stone as a tool or purposefully creating simple stone tools.", forKey: "Hand")
        popUpDict.updateValue("Evidence for bipedality: The knee is angled inward like in humans, rather than the more vertical position found in chimpanzees. This difference in orientation moves the support the lower legs offer directly under the body's center of gravity", forKey: "Knee")
        popUpDict.updateValue("Evidence for bipedality: The pelvis is wide and bowl-shaped, as it is in humans.", forKey: "Pelvis")
        popUpDict.updateValue("Australopithecus afarensis lived in east Africa 3.9-2.9 million years ago in mosaic habitats of open woodland, grassland and shrubland", forKey: "Left Arm")
        popUpDict.updateValue("Evidence for bipedality: The lumbar portion of the spine curves inward as it does in humans to better support the weight of the upper body.", forKey: "Spine")
        popUpDict.updateValue("Lucy was discovered in exposed sediments in Hadar, Ethiopia. Additional fossils belonging to her species have also been found in othe sides in Ethiopia, Kenya and Tanzania.", forKey: "Right Arm")
        popUpDict.updateValue("The Australopithecus has a U shaped jaw in contrast with modern humans whose jaw is parabolic. The jaw muscles are also much larger in comparison to humans.", forKey: "Jaw")
        popUpDict.updateValue("Estimates of brain size range from 380 to 550 cubic centimeters(cc). This is similar in size to that of chimpanzees whse average 395cc and much smaller than modern humans whose average is 1475cc.", forKey: "Skull")
        popUpDict.updateValue("Australopithecus afarensis had a strongly protruding face similar to that of chimpanzees while humans are categorized by short faces", forKey: "Face")
        
    }
    
}
