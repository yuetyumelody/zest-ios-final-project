//
//  recipeConstantViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/3/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class recipeConstantViewController: UIViewController {

    @IBOutlet weak var instructionScroll: UIScrollView!
    var photoArray = [UIImage]();
    var textViewArray = [UITextView]()
    var captionArray = ["separate the flour", "knead the dough with machine", "portion the doughs in 4", "add toppings you like", "bake at 300 F and thats it!"]
    var textViewHeight = 92;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //instantiate images
        photoArray = [#imageLiteral(resourceName: "pizza1"), #imageLiteral(resourceName: "pizza2"), #imageLiteral(resourceName: "pizza3"), #imageLiteral(resourceName: "pizza4"), #imageLiteral(resourceName: "pizza 5")]
        
        //scrolling photos
        for i in 0 ..< photoArray.count{
            let imageView = UIImageView()
            
            imageView.image = photoArray[i];
            imageView.contentMode = .scaleAspectFit
            
            let xPos = Int(self.view.frame.width) * i
            
            imageView.frame = CGRect(x: xPos, y: 10, width: Int(self.instructionScroll.frame.width), height: Int(self.instructionScroll.frame.height))
            instructionScroll.contentSize.width = instructionScroll.frame.width * CGFloat(i+1)
            instructionScroll.addSubview(imageView)
            
            //adding captions to scolls
            let caption = UITextView()
            caption.text = captionArray[i];
            caption.textColor = UIColor(displayP3Red: 255, green: 255, blue: 255, alpha: 1)
            caption.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
            caption.frame = CGRect(x: xPos, y: 200, width: Int(self.instructionScroll.frame.width), height: 50)
            instructionScroll.addSubview(caption)
        }
        
        
    }
    
    @IBAction func recipeLiked(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little,  preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
