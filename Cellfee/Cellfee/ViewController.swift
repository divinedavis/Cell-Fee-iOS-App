//
//  ViewController.swift
//  Cellfee
//
//  Created by Divine Davis on 9/28/15.
//  Copyright © 2015 Divine Davis. All rights reserved.
//


import UIKit
import Social

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func selfieTapped(sender: AnyObject) {
        
        //creates a new UIImagePickerController and sets it to the imagePicker variable
        let imagePicker = UIImagePickerController()
        
        //self the imagePicker's delegate property to the current view controller
        imagePicker.delegate = self
        
        //sets the imagePicker's sourceType property to .Camera
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            //checking if a front camera is available
            imagePicker.sourceType = .Camera
            
            //if so, set it to the front camera
            if (UIImagePickerController.isCameraDeviceAvailable(.Front)) {
                
                //setting it to the front camera
                imagePicker.cameraDevice = .Front
                
            } else {
                
                //setting it to the rear camera if the front is not available
                imagePicker.cameraDevice = .Rear
            }
            
        } else {
            
            //if the camera is not available, the photo library will be shown
            imagePicker.sourceType = .PhotoLibrary
        }
        
        //presents the imagePicker modally, sliding it up from the bottom of the screen and it animates the transition
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    //this method will be called when the user has taken a photo or has selected a photo from the photo library
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        
        //takes the image parameter and displays it inside myImageView
        myImageView.image = image
        
        //hides the imagePicker and animates the transition
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func shareTapped(sender: AnyObject) {
        
        //sets the serviceType property to Facebook
        let facebookSocial = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        //myImageView image is added to the Facebook post
        facebookSocial.addImage(myImageView.image)
        
        //it is displayed and uses animation
        self.presentViewController(facebookSocial, animated: true, completion: nil)
        
        
    }
    
    


}

