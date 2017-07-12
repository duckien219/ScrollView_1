//
//  ScrollView.swift
//  ScrollView
//
//  Created by Kien Nguyen Duc on 7/4/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class ScrollView: UIViewController, UIScrollViewDelegate {
    let imgView = UIImageView(image: UIImage(named: "image.jpg"))
    
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBAction func sliderForZoom(_ sender: Any) {
        //Truyền vào giá trị (0->10) để zoom
        ScrollView.setZoomScale(CGFloat((sender as! UISlider).value), animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.frame = CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)
        imgView.contentMode = .scaleAspectFit
        imgView.isUserInteractionEnabled = true
        imgView.isMultipleTouchEnabled = true
        
        ScrollView.contentSize = CGSize(width: imgView.bounds.width, height: imgView.bounds.height)
        ScrollView.minimumZoomScale = 1
        ScrollView.maximumZoomScale = 10
        self.ScrollView.addSubview(imgView)
    }
    func viewForZooming(in ScrollView: UIScrollView) -> UIView? {
        return imgView
    }
    
}
