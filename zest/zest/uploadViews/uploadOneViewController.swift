//
//  uploadOneViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 4/27/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class uploadOneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //IBOutlets
    @IBOutlet weak var recipeName: UITextField!
    
    @IBOutlet weak var prepTimeHours: UITextField!
    
    @IBOutlet weak var prepTimeMinutes: UITextField!
    
    @IBOutlet weak var ingredientField: UITextField!
    
    @IBOutlet weak var addIngredientBtn: UIButton!
    
    @IBOutlet weak var difficultyField: UITextField!
    
    var diffPicker = UIPickerView();
    
    
    //picker selection
    let difficultyLevels = ["easy", "intermediate", "hard"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficultyLevels[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficultyLevels.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        difficultyField.text = difficultyLevels[row];
        difficultyField.resignFirstResponder();
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //load picker
        diffPicker.delegate = self;
        diffPicker.dataSource = self;
        
        difficultyField.inputView = diffPicker;
        difficultyField.textAlignment = .center;
        difficultyField.placeholder = "Select Difficulty";

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
