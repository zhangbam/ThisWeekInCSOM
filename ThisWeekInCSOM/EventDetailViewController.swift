//
//  EventDetailViewController.swift
//  ThisWeekInCSOM
//
//  Created by Angela Zhang on 7/28/2013.
//  Copyright © 2017 Angela Zhang. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var timeTextView: UITextView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var emailTextView: UITextView!
    @IBOutlet weak var linkTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    var listItem: Event?
    var eventName: String?
    var dateString: String?
    var addEvents: [Event]?
    var parentReference: ListVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        if addEvents != nil {
            nameTextField.text = ""
            dateTextField.text = ""
            timeTextView.text = ""
            locationTextField.text = ""
            descriptionTextView.text = ""
            linkTextView.text = ""
            emailTextView.text = ""
        } else {
        nameTextField.text = listItem?.name
        dateTextField.text = listItem?.date
        timeTextView.text = listItem?.time
        locationTextField.text = listItem?.location
        descriptionTextView.text = listItem?.desc 
        linkTextView.text = listItem?.link
        emailTextView.text = listItem?.email
        }
        if admin == true {
            timeTextView.isEditable = true
            
            locationTextField.isUserInteractionEnabled = true
            locationTextField.borderStyle = UITextBorderStyle.roundedRect
            descriptionTextView.isEditable = true
            linkTextView.isEditable = true
            emailTextView.isEditable = true
            nameTextField.isUserInteractionEnabled = true
            saveButton.isEnabled = true
            cancelButton.isEnabled = true
            dateTextField.isUserInteractionEnabled = true
            descriptionTextView.layer.borderColor = UIColor.black.cgColor
            descriptionTextView.layer.borderWidth = 1
            timeTextView.layer.borderWidth = 1
            timeTextView.layer.borderColor = UIColor.black.cgColor
        }else {
            timeTextView.isEditable = false
            locationTextField.isUserInteractionEnabled = false
            descriptionTextView.isEditable = false
            linkTextView.isEditable = false
            emailTextView.isEditable = false
            nameTextField.isUserInteractionEnabled = false
            saveButton.isEnabled = false
            cancelButton.isEnabled = false
            dateTextField.isUserInteractionEnabled = false
        }
        
    }
    
    
    
    
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    
    
}
