//
//  ViewController.swift
//  FoodTracker
//
//  Created by DingJH on 15/11/13.
//  Copyright © 2015年 Ding. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //------------------------------------
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
    }
    
    
    //-------------------------------------
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //Dismiss the picker if the user canceled
        dismissViewControllerAnimated(true, completion: nil )
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //The info dictionary contains multiple representations of the image, and this user the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        //Set photoImageView to display the seleceted image.
        photoImageView.image = selectedImage
        
        //Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil )
    }
    
    //--------------------------------------
    //MARK: Action
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        //Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        //UIImagePickerController that lets a uesr pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        //Only allow photo to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        //Make sure ViewController is notified when the uesr picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil )
        
    }

}
