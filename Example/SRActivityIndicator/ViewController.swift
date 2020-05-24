//
//  ViewController.swift
//  SRActivityIndicator
//
//  Created by sarojraut on 11/22/2019.
//  Copyright (c) 2019 sarojraut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     func showAlert() {
       let alert = UIAlertController(title: "Stop", message: "Please Select Stop", preferredStyle: .actionSheet)

              alert.addAction(UIAlertAction(title: "stop", style: .default, handler:{ (UIAlertAction)in
                  SRActivityIndicator.dissmiss()
              }))

              self.present(alert, animated: true, completion: {
                  print("completion block")
              })
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        SRActivityIndicator.innerStrokeColor = UIColor.white
        SRActivityIndicator.outerStrokeColor = UIColor.red
        SRActivityIndicator.centerImageSize = 50
        SRActivityIndicator.centerImage = UIImage(named: "globe.jpg")!
        SRActivityIndicator.show()
        showAlert()
    }
    
    
}

