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
           
           override func viewDidLoad() {
               super.viewDidLoad()
               activityIndicator.innerStrokeColor = UIColor.white
               activityIndicator.outerStrokeColor = UIColor.clear
               activityIndicator.centerImage = UIImage(named: "globe.jpg")!
               activityIndicator.show()
        }
        
       
        
        @IBAction func showAlert(sender: AnyObject) {
            let alert = UIAlertController(title: "Change Color", message: "Please Select an Option", preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "OuterStrokeColor", style: .default , handler:{ (UIAlertAction)in
                self.activityIndicator.outerStrokeColor = UIColor.yellow
                self.activityIndicator.draw(self.activityIndicator.frame)
            }))

            alert.addAction(UIAlertAction(title: "innerStrokeColor", style: .default , handler:{ (UIAlertAction)in
                self.activityIndicator.innerStrokeColor = UIColor.green
                self.activityIndicator.draw(self.activityIndicator.frame)
            }))

            alert.addAction(UIAlertAction(title: "outerFillColor", style: .default , handler:{ (UIAlertAction)in
                self.activityIndicator.outerFillColor = UIColor.white
                self.activityIndicator.draw(self.activityIndicator.frame)
            }))

            alert.addAction(UIAlertAction(title: "CenterImage", style: .default, handler:{ (UIAlertAction)in
                self.activityIndicator.centerImage = UIImage(named: "image.jpg")!
                self.activityIndicator.draw(self.activityIndicator.frame)

            }))

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
        
        
        @IBAction func stopAnimating(_ sender: Any) {
            self.activityIndicator.stopAnimating()
        }
        

    }

