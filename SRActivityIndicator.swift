//
//  SR_ActivityIndicator.swift
//  SR_Activity_Indicator
//
//  Created by Saroj on 4/7/16.
//  Copyright © 2016 Saroj. All rights reserved.
///

import UIKit

@IBDesignable
public class SRActivityIndicator: UIView {
    
    @IBInspectabledsfsdf
    public var hidesWhenStopped : Bool = true
    @IBInspectable
    public var outerFillColor : UIColor = UIColor.clear
    @IBInspectable
    public var outerStrokeColor : UIColor = UIColor.gray
    @IBInspectable
    public var outerLineWidth : CGFloat = 5.0
    @IBInspectable
    public var outerEndStroke : CGFloat = 1.0
    @IBInspectable
    public var outerAnimationDuration : CGFloat = 2.0
    @IBInspectable
    public var enableInnerLayer : Bool = true
    @IBInspectable
    public var innerFillColor : UIColor  = UIColor.clear
    @IBInspectable
    public var innerStrokeColor : UIColor = UIColor(red: 208/255, green: 154/255, blue: 35/255, alpha: 1)
    @IBInspectable
    public var centerImageSize: CGFloat = 50
    @IBInspectable
    public var centerImage: UIImage? = UIImage(named: "image")
    @IBInspectable
    public var innerLineWidth : CGFloat = 5.0
    @IBInspectable
    public var innerEndStroke : CGFloat = 0.5
    @IBInspectable
    public var innerAnimationDuration : CGFloat = 1.0
    
    @IBInspectable
    public var currentInnerRotation : CGFloat = 0
    @IBInspectable
    public var currentOuterRotation : CGFloat = 0
    
    public var innerView : UIView = UIView()
    public var outerView : UIView = UIView()
    public var centerView : UIImageView = UIImageView()
    
    //MARK:- init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    private func commonInit(){
        self.frame =  CGRect(x: 0, y: 0, width: centerImageSize + 25, height: centerImageSize + 25)
        self.backgroundColor = UIColor.clear
    }
    
    //MARK:- draw
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
    
    //MARK:- Public
    
    public func animateInnerRing(){
        innerView.layer.removeAllAnimations()
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
    
    public func show() -> SRActivityIndicator {
        self.isHidden = false
        alpha = 1
        
        guard let window = UIApplication.shared.delegate?.window??.rootViewController?.view else {fatalError("Root View Controller not found....")}
        self.center = window.center
        window.addSubview(self)
        
        self.animateInnerRing()
        return self
    }
    
    public func dissmiss(){
        if hidesWhenStopped{
            hide()
        }
    }

    //MARK:- private
    private func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }, completion: { (true) in
            self.isHidden = true
            self.outerView.layer.removeAllAnimations()
            self.innerView.layer.removeAllAnimations()
        })
    }
}




