//
//  LucyViewController.swift
//  IHO
//
//  Created by Desai, Dhruti on 4/20/19.
//  Copyright © 2019 vkasam. All rights reserved.
//

import UIKit
import WebKit

class LucyViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{
    
//    @IBOutlet weak var LucyWeb: UIWebView!
//    var htmlpath: String? = nil
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        htmlpath = Bundle.main.path(forResource: "lucy", ofType: "html")
//        let html = try? String(contentsOfFile: htmlpath!, encoding: String.Encoding.utf8)
//        let baseURL = URL(fileURLWithPath: "\(Bundle.main.bundlePath)")
//        self.LucyWeb.scalesPageToFit = false
//        self.LucyWeb.loadHTMLString(html!, baseURL: baseURL)
//        self.LucyWeb.scrollView.isScrollEnabled = true
//
//        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(350), height: CGFloat(21)))
//        label.text = "ASU IHO 2019"
//        label.center = CGPoint(x: view.frame.midX, y: view.frame.height)
//        label.textAlignment = NSTextAlignment.center
//        label.textColor = UIColor.white
//
//        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var twoDLucyView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        twoDLucyView = WKWebView(frame: .zero, configuration: webConfiguration)
        twoDLucyView.uiDelegate = self
        view = twoDLucyView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        twoDLucyView.uiDelegate = self
        twoDLucyView.navigationDelegate = self
        
        let url = Bundle.main.url(forResource: "lucy", withExtension: "html", subdirectory: "IHO")!
        twoDLucyView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        twoDLucyView.load(request)
        
//        super.viewDidLoad()
//        htmlpath = Bundle.main.path(forResource: "lucy", ofType: "html")
//        let html = try? String(contentsOfFile: htmlpath!, encoding: String.Encoding.utf8)
//        let baseURL = URL(fileURLWithPath: "\(Bundle.main.bundlePath)")
//        let myURL = URL(string: baseURL)
//        let myRequest = URLRequest(url: myURL!)
//        twoDLucyView.load(myRequest)
    }
    
    
//    /// Creates An SCNNode With A Plane Geometry & UIView As A Material
//    func createUIViewOnNode(){
//
//        //1. Create An Empty Node
//        let holderNode = SCNNode()
//
//        //2. Set It's Geometry As An SCNPlane
//        holderNode.geometry = SCNPlane(width: 0.6, height: 0.3)
//
//        //2. Create A New Material
//        let material = SCNMaterial()
//
//        //3. Create A UIView As A Holder For Content
//        let viewToAdd = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//        viewToAdd.backgroundColor = .white
//
//        //4. Create Two Subviews
//        let redView = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
//        redView.backgroundColor = .red
//        viewToAdd.addSubview(redView)
//
//        let cyanView = UIView(frame: CGRect(x: 110, y: 10, width: 100, height: 100))
//        cyanView.backgroundColor = .cyan
//        viewToAdd.addSubview(cyanView)
//
//        //5. Set The Materials Contents
//        material.diffuse.contents = viewToAdd
//
//        //6. Set The 1st Material Of The Plane
//        holderNode.geometry?.firstMaterial = material
//        material.isDoubleSided = true
//
//        //7. Add To The Scene & Position It
//        augmentedRealityView.scene.rootNode.addChildNode(holderNode)
//
//        holderNode.position = SCNVector3(0, 0, -1.5)
//    }
    

}
