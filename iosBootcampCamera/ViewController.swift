//
//  ViewController.swift
//  iosBootcampCamera
//
//  Created by Madison White on 9/16/15.
//  Copyright © 2015 Epocrates. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var returnedImage: UIImageView!
    
    @IBAction func captureButtonPressed(sender: UIButton){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .Camera
            imagePickerController.allowsEditing = false
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func addSepiaFilter(sender: UIBUtton){

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String:AnyObject]?){
        
        self.dismissViewControllerAnimated(true, completion: {
            let filter = CIFilter(name: "CISepiaTone")!
            filter.setValue(CIImage(image: image),forKey: kCIInputImageKey)
            let newImage = UIImage(CIImage: filter.outputImage!, scale : image.scale, orientation: image.imageOrientation)
            
            self.returnedImage.image = newImage
            
            //Bonus
            //UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        })
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

