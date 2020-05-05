//
//  signOrLogView.swift
//  zest
//
//  Created by Rohit Sai Gopal on 5/1/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class signOrLogView: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
