//
//  ingredientsV2ViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/3/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class ingredientsV2ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //rating selection through picker
    var ratingPicker =  UIPickerView();
    let ratingsArray = [1,2,3,4,5]
    var selectedRating = 0
    @IBOutlet weak var rating: UITextField!
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return String(ratingsArray[row])
       }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratingsArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating.text = String(ratingsArray[row]);
        self.selectedRating = ratingsArray[row]
        rating.resignFirstResponder();
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingPicker.delegate = self
        ratingPicker.dataSource = self
        
        rating.inputView = ratingPicker
        rating.textAlignment = .center
        rating.placeholder = "Rate this recipe!"

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
