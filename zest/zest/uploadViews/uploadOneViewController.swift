//
//  uploadOneViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 4/27/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit
import Firebase

class uploadOneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Firebase stuff
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    let recipeIdentifier =  UUID().uuidString;
    
    //IBOutlets
    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var prepTimeMinutes: UITextField!
    @IBOutlet weak var ingredientField: UITextField!
    @IBOutlet weak var addIngredientBtn: UIButton!
    @IBOutlet weak var difficultyField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    
    // ingredients collection view
    @IBOutlet weak var ingredientCollection: UICollectionView!
    
    
    
    var diffPicker = UIPickerView();
    var selectedDifficulty = "";
    
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
        self.selectedDifficulty = difficultyLevels[row]
        difficultyField.resignFirstResponder();
        
    }
    
// all the variables
//    let recipeInput: String?
//    let prepTime: integer_t?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //load picker
        diffPicker.delegate = self;
        diffPicker.dataSource = self;
        
        difficultyField.inputView = diffPicker;
        difficultyField.textAlignment = .center;
        difficultyField.placeholder = "Select Difficulty";
        
        //ingredient view
        ingredientCollection.delegate = self
        ingredientCollection.dataSource = self
        
        //db reference
        
        // Do any additional setup after loading the view.
    }
    
    //Add a category
    let availableCategories = ["vegan","vegetarian","kid-friendly","wheat/gluten friendly","dairy free"]
    var selectedCategories = [String]()
    let categoryAlert  = UIAlertController(title: "invalid category", message: " please enter either vegan, vegetarian, kid-friendly, wheat/gluten friendly or dairy free", preferredStyle: UIAlertController.Style.alert)
    let alertAction = UIAlertAction(title: "got it!", style: .cancel  , handler: nil)
    
    
    @IBAction func categoryAdded(_ sender: Any) {
        guard let inputCategory = self.categoryField.text else { return  }
        
        if availableCategories.contains(inputCategory) && !selectedCategories.contains(inputCategory) {
            selectedCategories.append(inputCategory)
            
            let successAddedAlert = UIAlertController(title: "successfully added", message: inputCategory, preferredStyle: .alert)
            let successAction = UIAlertAction(title: "okay", style: .cancel, handler: nil)
            successAddedAlert.addAction(successAction)
            self.present(successAddedAlert, animated: true, completion: nil)
            
            
        } else {
            let categoryAlert  = UIAlertController(title: "invalid category", message: "please enter either vegan, vegetarian, kid-friendly, wheat/gluten friendly or dairy free", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "got it!", style: .cancel  , handler: nil)
            categoryAlert.addAction(alertAction)
            self.present(categoryAlert, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    
    @IBAction func saveRecipe(_ sender: Any) {
        let inputRecipe = self.recipeName.text
        let prepTime = self.prepTimeMinutes.text
//        let calories = self.caloriesField.text
        
        
        if ( self.recipeName.text?.isEmpty ?? true  || self.prepTimeMinutes.text?.isEmpty ?? true || self.ingreArray.count == 0){
            
            let missingItemAlert = UIAlertController(title: "Missing Fields", message: "missing recipe name, prep time or ingredients", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "okay", style: .cancel, handler: nil)
            missingItemAlert.addAction(dismissAction)
            self.present(missingItemAlert, animated: true, completion: nil)
            
        }
        else {
        db.collection("recipes").document(recipeIdentifier).setData([
            "recipeName" : inputRecipe ?? "Unknown Recipe Name",
            "difficulty" : self.selectedDifficulty,
            "prepTime" : prepTime ?? "NA",
            
        ])
            
        }
        
    }
    
    @IBAction func validateSubmission(_ sender: UIBarButtonItem) {
        print("next button pressed")
    }
    
    // ingredient collection view stuff
    //Add ingredients
    var ingreArray = [String]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingreArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! ingredientCollectionViewCell
        
        cell.ingredientName.text = ingreArray[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func addIngredient(_ sender: Any) {
        ingreArray.append(ingredientField.text!)
        ingredientCollection.reloadData()
        ingredientField.text = ""
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
