//
//  ViewController.swift
//  SRActivityIndicator
//
//  Created by sarojraut on 11/22/2019.
//  Copyright (c) 2019 sarojraut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var activityIndicator =  SRActivityIndicator()
    
     func showAlert() {
       let alert = UIAlertController(title: "Stop", message: "Please Select Stop", preferredStyle: .actionSheet)

              alert.addAction(UIAlertAction(title: "stop", style: .default, handler:{ (UIAlertAction)in
                  self.activityIndicator.dissmiss()
              }))

              self.present(alert, animated: true, completion: {
                  print("completion block")
              })
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        activityIndicator.innerStrokeColor = UIColor.white
        activityIndicator.outerStrokeColor = UIColor.red
        activityIndicator.centerImage = UIImage(named: "globe.jpg")!
       activityIndicator.show()
       showAlert()
    }
    
    
}

