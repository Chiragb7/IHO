//
//  popUpDialog.swift
//  IHO
//
//  Created by vkasam on 2/28/19.
//  Copyright © 2019 Desai, Dhruti. All rights reserved.
//

import Foundation
import UIKit

class popUpDialog: UIView, PopModal {
    
    //creating the specific UI Views of the Dialog box
    var BGView = UIView()
    var POPView = UIView()
    
    //creating the respective initializers
    
    convenience init(title:String){ //, image:UIImage) {
        self.init(frame: UIScreen.main.bounds)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //need to override the method when we create our own initializer
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //setting up the attributes of the background view in the popup box
    BGView.frame = frame
    BGView.backgroundColor = UIColor.black
    BGView.alpha = 0.6
    //add the background view to the subview
    addSubView(BGView)
    
    //adding the attributes to the popUpView which displays the Lucy Information
    let POPViewWidth = 40
    let LucyInfo = UILabel(frame: CGRect(x: 4, y: 4, width: POPViewWidth-16, height: 20))
    LucyInfo.text = title
    LucyInfo.textAlignment = .center
    //adding the popup view to the scene view
    POPView.addSubView(LucyInfo)
    
    
}
