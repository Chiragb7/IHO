//
//  2DLucyViewController.swift
//  IHO
//
//  Created by Desai, Dhruti on 4/14/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import UIKit
import Foundation

class _DLucyViewController: UIViewController {
    var htmlpath: String? = nil
    
    @IBOutlet weak var lucyLogo: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Lucy LOGO
        htmlpath = Bundle.main.path(forResource: "lucy", ofType: "html")
        var html = try? String(contentsOfFile: htmlpath!, encoding: String.Encoding.utf8)
        var baseURL = URL(fileURLWithPath: "\(Bundle.main.bundlePath)")
        self.lucyLogo.scalesPageToFit = false
        self.lucyLogo.loadHTMLString(html!, baseURL: baseURL)
        self.lucyLogo.scrollView.isScrollEnabled = true
        
        
        //toolbar
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(350), height: CGFloat(21)))
        label.text = "ASU IHO 2019"
        label.center = CGPoint(x: view.frame.midX, y: view.frame.height)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        let toolbarTitle = UIBarButtonItem(customView: label)
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [flexible,toolbarTitle]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden=false;
        self.navigationController?.setToolbarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setToolbarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}





