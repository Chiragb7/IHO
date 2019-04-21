//
//  LucyViewController.swift
//  IHO
//
//  Created by Desai, Dhruti on 4/20/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import UIKit

class LucyViewController: UIViewController {
    @IBOutlet weak var LucyWeb: UIWebView!
    var htmlpath: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        

        htmlpath = Bundle.main.path(forResource: "lucy", ofType: "html")
        let html = try? String(contentsOfFile: htmlpath!, encoding: String.Encoding.utf8)
        let baseURL = URL(fileURLWithPath: "\(Bundle.main.bundlePath)")
        self.LucyWeb.scalesPageToFit = false
        self.LucyWeb.loadHTMLString(html!, baseURL: baseURL)
        self.LucyWeb.scrollView.isScrollEnabled = true
        
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(350), height: CGFloat(21)))
        label.text = "ASU IHO 2019"
        label.center = CGPoint(x: view.frame.midX, y: view.frame.height)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
