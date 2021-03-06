//
//  profileViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 4/27/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    // following status changes
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var followStatus: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // ======================================

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var likedRecipView: UIView!
    
    //=====================================
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        
        var switchCase = sender.selectedSegmentIndex
        
        switch switchCase {
            
        case 0:
            blueView.alpha = 1
            greenView.alpha = 0
            likedRecipView.alpha = 0
        case 1:
            blueView.alpha = 0
            greenView.alpha = 1
            likedRecipView.alpha = 0
            
        case 2:
            blueView.alpha = 0
            greenView.alpha = 0
            likedRecipView.alpha = 1
        
        default:
            print("Error in segment Contro")
            
        }
       
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
