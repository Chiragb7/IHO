//
//  FossilInfoViewController.swift
//  IHO
//
//  Created by vkakarla on 3/13/19.
//  Copyright © 2019 Desai, Dhruti. All rights reserved.
//

import UIKit

class FossilInfoViewController : UIViewController {
    @IBOutlet weak var fossilNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var informationText: UITextView!
    
    var fossilInfo : FossilInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let actualFossilInfo = fossilInfo {
            self.fossilNameLabel.text = actualFossilInfo.name
            self.imageView.image = actualFossilInfo.image
            self.informationText.text = actualFossilInfo.information
        };<#code#>
    }
}
