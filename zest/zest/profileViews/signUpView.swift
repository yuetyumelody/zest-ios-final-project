//
//  signUpView.swift
//  zest
//
//  Created by Rohit Sai Gopal on 5/1/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class signUpView: UIViewController {
    static var usernm: String!
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
        
    }
    
    func setUpElements(){
        //hide error label
        errorLabel.alpha = 0;
        
        //style text fields and buttons
        Utilities.styleTextField(FirstNameTextField)
        Utilities.styleTextField(LastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(usernameTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    func validateFields() -> String? {
        signUpView.usernm = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        // see if all fields are correctly entered or not
        
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            || LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
            || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
            || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
            || usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""{
            return "Oops, looks like one or more fields are not filled in. Please try again!"
        }
        
        // check if password is secure enough
        let trimmmedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(trimmmedPassword)==false {
            // password is NOT secure enough
            return "Please make sure your password is at least 8 characters long and contains one number and a special character"
        }
        return nil
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func signUpTapped(_ sender: Any) {
        self.transitionToHome()
        let error = validateFields()
        if error != nil{
            //show error message if something else is wrong
            displayErrorMessage(error!)
        }
        else{
            //trim the data
            let firstname = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailID = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create the user
            Auth.auth().createUser(withEmail: emailID, password: password) { (res, err) in
                
                //see if there are any errors
                
                if err != nil{
                    self.displayErrorMessage("Error creating User")
                }
                else{
                    
                // Successfully created a User
                    
                    let db = Firestore.firestore()
                    
//                    db.collection("Users").addDocument(data: ["firstname" : firstname , "lastname" : lastname , "username" : username, "password" : password, "email" : emailID]) {(error) in
//
//                        if error != nil{
//                            self.displayErrorMessage("User data could not be stored properly")
//                        }
//                    }
                    
                    
                    db.collection("Users").document(emailID).setData(["firstname" : firstname , "lastname" : lastname , "username" : username , "password" : password, "email" : emailID]) { (err) in
                        if error != nil{
                            self.displayErrorMessage("User data could not be stored properly")  //i made the email as our key because it made it easier to acess the data from the database
                                                }
                    }
                    //transition to home
                    self.transitionToHome()
                }
            }
            
            
        }
        
    }
    func displayErrorMessage(_ message : String){
        errorLabel.alpha = 1
        errorLabel.text = message
    }
    
    func transitionToHome(){
        errorLabel.alpha = 0;
        let homeViewController = storyboard?.instantiateViewController(identifier: "tabBarVC") as? UITabBarController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        homeViewController?.selectedIndex = 2
    }
    
}
