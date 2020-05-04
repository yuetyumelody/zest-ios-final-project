//
//  ingrePopUpViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/4/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class ingrePopUpViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var iArray = ["Flour", "Olive Oil", "Tomatoes", "Basil Leaves", "Eggs"]
    
    //Ingredient collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "ingreCell", for: indexPath) as! ingreCollectionViewCell
        
        cell.ingredient.text = iArray[indexPath.row]
        
        return cell
    }
    
    
    @IBOutlet weak var ingreCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ingreCollection.delegate = self
        ingreCollection.dataSource = self
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
