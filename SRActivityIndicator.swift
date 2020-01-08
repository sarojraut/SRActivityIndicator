//
//  SR_ActivityIndicator.swift
//  SR_Activity_Indicator
//
//  Created by Saroj on 4/7/16.
//  Copyright © 2016 Saroj. All rights reserved.
///

import UIKit

public class SRActivityIndicator: UIView {
    
    public var hidesWhenStopped : Bool = true
    public var outerFillColor : UIColor = UIColor.clear
    public var outerStrokeColor : UIColor = UIColor.gray
    public var outerLineWidth : CGFloat = 5.0
    public var outerEndStroke : CGFloat = 1.0
    public var outerAnimationDuration : CGFloat = 2.0
    public var enableInnerLayer : Bool = true
    public var innerFillColor : UIColor  = UIColor.clear
    public var innerStrokeColor : UIColor = UIColor(red: 208/255, green: 154/255, blue: 35/255, alpha: 1)
    public var centerImageSize: CGFloat = 50
    public var centerImage: UIImage? = UIImage(named: "image")
    public var innerLineWidth : CGFloat = 5.0
    public var innerEndStroke : CGFloat = 0.5
    public var innerAnimationDuration : CGFloat = 1.0
    
   public var currentInnerRotation : CGFloat = 0
   public var currentOuterRotation : CGFloat = 0
    
   public var innerView : UIView = UIView()
   public var outerView : UIView = UIView()
   public var centerView : UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.commonInit()
    }
    
    func commonInit(){
        self.frame =  CGRect(x: 0, y: 0, width: centerImageSize + 25, height: centerImageSize + 25)
        self.backgroundColor = UIColor.clear
    }
    
    override public func draw(_ rect: CGRect) {
        
        self.addSubview(outerView)
        outerView.frame = CGRect(x: 0 , y: 0, width: rect.size.width, height: rect.size.height)
        outerView.center = self.convert(self.center, from: self.superview!)
        
        let outerLayer = CAShapeLayer()
        outerLayer.path = UIBezierPath(ovalIn: outerView.bounds).cgPath
        outerLayer.lineWidth = outerLineWidth
        outerLayer.strokeStart = 0.0
        outerLayer.strokeEnd = outerEndStroke
        //outerLayer.lineCap =  CAShapeLayerLineCap(rawValue: "round") as String
        outerLayer.fillColor = outerFillColor.cgColor
        outerLayer.strokeColor = outerStrokeColor.cgColor
        outerView.layer.addSublayer(outerLayer)
        
        self.addSubview(centerView)
        centerView.frame = CGRect(x: 0, y: 0, width: centerImageSize, height: centerImageSize)
        centerView.layer.cornerRadius = centerView.frame.width / 2
        centerView.clipsToBounds = true
        centerView.center = self.convert(self.center, from: self.superview!)
        centerView.image = centerImage
        
        
        if enableInnerLayer{
            
            self.addSubview(innerView)
            innerView.frame = CGRect(x: 0 , y: 0, width: rect.size.width , height: rect.size.height)
            innerView.center =  self.convert(self.center, from: self.superview!)
            let innerLayer = CAShapeLayer()
            innerLayer.path = UIBezierPath(ovalIn: innerView.bounds).cgPath
            innerLayer.lineWidth = innerLineWidth
            innerLayer.strokeStart = 0
            innerLayer.strokeEnd = innerEndStroke
            //innerLayer.lineCap = CAShapeLayerLineCap.round
            innerLayer.fillColor = innerFillColor.cgColor
            innerLayer.strokeColor = innerStrokeColor.cgColor
            
            innerView.layer.addSublayer(innerLayer)
        }
        self.startAnimating()
    }
    
   public func animateInnerRing(){
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0 * CGFloat(Double.pi/180)
        rotationAnimation.toValue = 360 * CGFloat(Double.pi/180)
        rotationAnimation.duration = Double(innerAnimationDuration)
        rotationAnimation.repeatCount = HUGE
        self.innerView.layer.add(rotationAnimation, forKey: "rotateInner")
    }
    
    
  public  func startAnimating(){
        
        self.isHidden = false
        self.animateInnerRing()
    }
    
    
    public func show(){
        self.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        }, completion: { (true) in
            let delegate = UIApplication.shared.delegate
            self.center = (delegate!.window!?.rootViewController?.view.center)!
            delegate!.window!?.rootViewController?.view.addSubview(self)
            self.animateInnerRing()
        })
        
        
    }
    
    public func dissmiss(){
         if hidesWhenStopped{
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = 0
            }, completion: { (true) in
                self.isHidden = true
                self.outerView.layer.removeAllAnimations()
                self.innerView.layer.removeAllAnimations()
            })
           }
         
    }
    
  public  func stopAnimating(){
        if hidesWhenStopped{
            UIView.animate(withDuration: 0.3, animations: {
                           self.alpha = 0
                       }, completion: { (true) in
                           self.isHidden = true
                        self.outerView.layer.removeAllAnimations()
                        self.innerView.layer.removeAllAnimations()
                       })
        }
       
        
    }
}




