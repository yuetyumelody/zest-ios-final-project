//
//  loginView.swift
//  zest
//
//  Created by Rohit Sai Gopal on 5/1/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class loginView: UIViewController {
    
    @IBOutlet weak var loginEmail: UITextField!
    
    @IBOutlet weak var loginPassword: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
        Utilities.styleFilledButton(loginButton)
        Utilities.styleTextField(loginEmail)
        Utilities.styleTextField(loginPassword)
    }
    
    func displayErrorMessage(_ message : String){
        errorLabel.alpha = 1
        errorLabel.text = message
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //trmming the user input
        let email = loginEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = loginPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        //validate the user
        func validateFields() -> String? {
            // see if all fields are correctly entered or not
            
            if loginEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                || loginPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
            {
                return "Oops, looks like one or more fields are not filled in. Please try again!"
            }
            return nil
        }
        //sign them in
        let error = validateFields()
        if error != nil{
            //show error message if something else is wrong
            displayErrorMessage(error!)
        }
        else{
            
            Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
                if err != nil{
                    self.errorLabel.text = err!.localizedDescription
                    self.errorLabel.alpha=1
                }
                else{
                    
                    self.errorLabel.alpha = 0
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: "tabBarVC") as? UITabBarController
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                    homeViewController?.selectedIndex = 2
                    
                    
                }
            }
            
        }
    }
    
}
