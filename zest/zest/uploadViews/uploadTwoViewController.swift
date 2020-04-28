//
//  UploadTwoViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 4/27/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class uploadTwoViewController: UIViewController {
    
    
    @IBOutlet weak var userInstructionsField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userInstructionsField.layer.borderWidth = 2;
        self.userInstructionsField.layer.borderColor = UIColor.orange.cgColor;

        // Do any additional setup after loading the view.
        
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
