//
//  SignInViewController.swift
//  ThisWeekInCSOM
//
//  Created by Angela Zhang on 7/28/2013.
//  Copyright © 2017 Angela Zhang. All rights reserved.
//

import UIKit


class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    var signInButton: UIBarButtonItem!
    var signOutButton: UIBarButtonItem!
    var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func incorrectLoginAlert() {
        let alertController = UIAlertController(title: "Incorrect Login", message: "Wrong Password or Username. Please try again.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

    @IBAction func adminLoginPressed(_ sender: UIButton) {
        if usernameTextField.text == username && passwordTextField.text == password {
            admin = true
            signInButton.isEnabled = false
            signOutButton.isEnabled = true
            addButton.isEnabled = true 
          self.navigationController?.popViewController(animated: true)
            
            
        } else {
            incorrectLoginAlert()
        }
        
    }
   
}
