//
//  triedSubViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/3/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit


class triedSubViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    //array of images
    var triedRecipesImages = [UIImage(named: "pizza 5"), UIImage(named: "FullSizeRender 3"),UIImage(named: "FullSizeRender 6"), UIImage(named: "FullSizeRender 7")]
    

    //COLLECTIONVIEW PROTOCOL STUBS
    @IBOutlet weak var triedCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return triedRecipesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "triedViewCell", for: indexPath) as! triedViewCell
        //the bunch of things to do
        cell.triedImage.image = triedRecipesImages[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.transitionToRecipe()
    }
    //======================================
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        triedCollection.delegate = self
        triedCollection.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    //present recipe Detail View
    func transitionToRecipe(){
        
        let recipeViewController = storyboard?.instantiateViewController(identifier: "ingredientVC") as? ingredientsV2ViewController
        
        view.window?.rootViewController = recipeViewController
        view.window?.makeKeyAndVisible()
        
    }
    //=============================


}
