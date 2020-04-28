//
//  ingredientsViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 4/27/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class ingredientsViewController: UIViewController {
    @IBOutlet weak var imageScrollView: UIScrollView!
    var imageArray = [UIImage]();
    var textViewArray = [UITextView]()
    var captionArray = ["caption 1", "caption 2", "caption 3", "caption 4"]
    var textViewHeight = 92;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imageScrollView.frame.height)
        
//        imageScrollView.frame = view.frame;

        imageArray = [#imageLiteral(resourceName: "FullSizeRender 3 2"),#imageLiteral(resourceName: "FullSizeRender 3"), #imageLiteral(resourceName: "FullSizeRender 6"), #imageLiteral(resourceName: "FullSizeRender")]
        // Do any additional setup after loading the view.
        
        //scrolling images
        for i in 0 ..< imageArray.count{
            let imageView = UIImageView()
            
            imageView.image =  imageArray[i];
            imageView.contentMode = .scaleAspectFit
            
            let xPos = Int(self.view.frame.width) * i
            imageView.frame = CGRect(x: xPos, y: 0, width: Int(self.imageScrollView.frame.width), height: Int(self.imageScrollView.frame.height))
            imageScrollView.contentSize.width = imageScrollView.frame.width * CGFloat(i+1)
            imageScrollView.addSubview(imageView)
            
            //adding captions to scolls
            let caption = UITextView()
            caption.text = captionArray[i];
            caption.frame = CGRect(x: xPos+50, y: 200, width: Int(self.imageScrollView.frame.width)-50, height: 92)
            imageScrollView.addSubview(caption)

            
            
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
