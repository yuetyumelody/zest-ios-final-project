//
//  uploadsViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/4/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class uploadsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Array of images
    var uploadedRecipes = [UIImage(named: "pizza1"),UIImage(named: "FullSizeRender"),UIImage(named: "FullSizeRender 7"),UIImage(named: "FullSizeRender 10")]

  //COLLECTIONVIEW PROTOCOL STUBS
    @IBOutlet weak var uploadsCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return uploadedRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uploadedImage", for: indexPath) as! uploadsViewCell
        
        cell.uploadedImage.image = uploadedRecipes[indexPath.row]
        
        return cell
    }
    
    
    //==============================


    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadsCollection.dataSource = self
        uploadsCollection.delegate = self

    }
    


}
