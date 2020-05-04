//
//  triedSubViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/3/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class triedCell: UICollectionViewCell{
    
    @IBOutlet weak var triedImage: UIImageView!
    @IBOutlet weak var triedInfoBox: UIView!
    
}

class triedSubViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var triedCollection: UICollectionView!
    
    
    
    
    //array of images
    var triedRecipesImages = [UIImage(named: "FullSizeRender 3 2"), UIImage(named: "FullSizeRender 3"),UIImage(named: "FullSizeRender 6"), UIImage(named: "FullSizeRender 7")]
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return triedRecipesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "triedCell", for: indexPath) as! triedCell
        //the bunch of things to do
        cell.triedImage.image = triedRecipesImages[indexPath.row]
        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
