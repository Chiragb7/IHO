//
//  popUpMesages.swift
//  IHO
//
//  Created by vkasam on 4/9/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import Foundation

public class popUpMessages {
    
    //Creating an empty dictionary
    var popUpDict: [String: String] = [:]
    var popUpTitle: [String: String] = [:]
    //adding key-value pairs into the dictionary with the bone name as the key and the popUp message as the value
    init() {
        
        
        popUpTitle.updateValue("rightFeet", forKey: "rightFeet")
        popUpTitle.updateValue("rightLeg", forKey: "rightLeg")
        popUpTitle.updateValue("rightFingers", forKey: "rightFingers")
        popUpTitle.updateValue("leftLegBone", forKey: "leftLegBone")
        popUpTitle.updateValue("rightHip", forKey: "rightHip")
        popUpTitle.updateValue("leftHand", forKey: "leftHand")
        popUpTitle.updateValue("spine", forKey: "spine")
        popUpTitle.updateValue("rightHand", forKey: "rightHand")
        popUpTitle.updateValue("Jaw", forKey: "Jaw")
        popUpTitle.updateValue("Brain", forKey: "Brain")
        popUpTitle.updateValue("Face", forKey: "Face")
        
        popUpDict.updateValue("Evidence for bipedality: The long bones of the foot in Australopithecus indicate that they had a human like longitudinal arc.", forKey: "rightFeet")
        popUpDict.updateValue("Humans walk on two legs (bipedally) and have long legs and short arms. Chimpanzees walk on all fours and have longer arms than legs. Australopithecus are thought to have walked bipedally and had arms that are relatively shorter than chimpanzees but are relatively longer than humans.", forKey: "rightLeg")
        popUpDict.updateValue("There is a controversial evidence for Australopithecus stone tool use. The oldest stone tool has been dated to 2.6 million years ago. It is possible that they were either using naturally broken stone as a tool or purposefully creating simple stone tools.", forKey: "rightFingers")
        popUpDict.updateValue("Evidence for bipedality: The knee is angled inward like in humans, rather than the more vertical position found in chimpanzees. This difference in orientation moves the support the lower legs offer directly under the body's center of gravity", forKey: "leftLegBone")
        popUpDict.updateValue("Evidence for bipedality: The pelvis is wide and bowl-shaped, as it is in humans.", forKey: "rightHip")
        popUpDict.updateValue("Australopithecus afarensis lived in east Africa 3.9-2.9 million years ago in mosaic habitats of open woodland, grassland and shrubland", forKey: "lefHand")
        popUpDict.updateValue("Evidence for bipedality: The lumbar portion of the spine curves inward as it does in humans to better support the weight of the upper body.", forKey: "spine")
        popUpDict.updateValue("Lucy was discovered in exposed sediments in Hadar, Ethiopia. Additional fossils belonging to her species have also been found in othe sides in Ethiopia, Kenya and Tanzania.", forKey: "rightHand")
        popUpDict.updateValue("The Australopithecus has a U shaped jaw in contrast with modern humans whose jaw is parabolic. The jaw muscles are also much larger in comparison to humans.", forKey: "Jaw")
        popUpDict.updateValue("Estimates of brain size range from 380 to 550 cubic centimeters(cc). This is similar in size to that of chimpanzees whse average 395cc and much smaller than modern humans whose average is 1475cc.", forKey: "Brain")
        popUpDict.updateValue("Australopithecus afarensis had a strongly protruding face similar to that of chimpanzees while humans are categorized by short faces", forKey: "Face")
        
    }
    
}
