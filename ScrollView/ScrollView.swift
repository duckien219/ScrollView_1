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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapImg))
        doubleTap.numberOfTapsRequired = 2
        tap.require(toFail: doubleTap) // Bỏ qua 'tap' khi 'doubleTap'
        imgView.addGestureRecognizer(doubleTap)
        
        
        ScrollView.contentSize = CGSize(width: imgView.frame.size.width, height: imgView.frame.size.height)
        ScrollView.minimumZoomScale = 1
        ScrollView.maximumZoomScale = 10
        
        self.ScrollView.addSubview(imgView)
    }
    func viewForZooming(in ScrollView: UIScrollView) -> UIView? {
        return imgView
    }
    
    func tapImg(gesture: UITapGestureRecognizer) {
        let position = gesture.location(in: imgView)
        zoomRectForScale(scale: ScrollView.zoomScale * 1.5, center: position)
    }
    
    func doubleTapImg(gesture: UITapGestureRecognizer) {
        let position = gesture.location(in: imgView)
        zoomRectForScale(scale: ScrollView.zoomScale * -1.5, center: position)
        
    }
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint) {
        var zoomRect = CGRect()
        let scrollViewSize = ScrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        print(zoomRect)
        ScrollView.zoom(to: zoomRect, animated: true)
    }
}
