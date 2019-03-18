//
//  PopModal.swift
//  IHO
//
//  Created by vkasam on 2/28/19.
//  Copyright © 2019 Desai, Dhruti. All rights reserved.
//

import Foundation
import UIKit

protocol PopModal{
    func show_popup()
    // setting up the background view
    var BGView:UIView{get}
    //setting uop the Dialog or the pop up view
    var POPView: UIView{get set}
}

extension PopModal where Self:UIView {
    func show_popup() {
        self.BGView.alpha = 0
        let x_c = self.center.x
        let y_c = self.frame.height+self.POPView.frame.height
        self.POPView.center = CGPoint(x: x_c, y: y_c)
        // UIApplication.shared.delegate?.window??.rootViewController?.view.addSubview(self)
        
        self.BGView.alpha = 0.5
        self.POPView.center = self.center
        
    }
}
