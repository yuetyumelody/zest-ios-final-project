//
//  uploadThreeViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 4/27/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class uploadThreeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var flag = 0;
    
    @IBOutlet weak var imgOne: UIImageView!
    @IBOutlet weak var imgTwo: UIImageView!
    @IBOutlet weak var imgThree: UIImageView!
    @IBOutlet weak var imgFour: UIImageView!
    @IBOutlet weak var imgFive: UIImageView!
    @IBOutlet weak var imgSix: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addImageOne(_ sender: UIButton) {
        flag = 1;
        let pickerOne = UIImagePickerController();
        pickerOne.sourceType = .savedPhotosAlbum;
        pickerOne.allowsEditing = true;
        pickerOne.delegate = self;
        self.present(pickerOne, animated: true, completion: nil);
        
    }
    
    @IBAction func addImageTwo(_ sender: Any) {
        flag = 2;
        let pickerTwo = UIImagePickerController();
        pickerTwo.sourceType = .savedPhotosAlbum;
        pickerTwo.allowsEditing = true;
        pickerTwo.delegate = self;
        self.present(pickerTwo, animated: true, completion: nil);
    }
    @IBAction func addImageThree(_ sender: Any) {
        flag = 3;
        let pickerThree = UIImagePickerController();
        pickerThree.sourceType = .savedPhotosAlbum;
        pickerThree.allowsEditing = true;
        pickerThree.delegate = self;
        self.present(pickerThree, animated: true, completion: nil);
    }
    @IBAction func addImageFour(_ sender: Any) {
        flag = 4;
        let pickerFour = UIImagePickerController();
        pickerFour.sourceType = .savedPhotosAlbum;
        pickerFour.allowsEditing = true;
        pickerFour.delegate = self;
        self.present(pickerFour, animated: true, completion: nil);
    }
    @IBAction func addImageFive(_ sender: Any) {
        flag = 5;
        let pickerFive = UIImagePickerController();
        pickerFive.sourceType = .savedPhotosAlbum;
        pickerFive.allowsEditing = true;
        pickerFive.delegate = self;
        self.present(pickerFive, animated: true, completion: nil);
    }
    @IBAction func addImageSix(_ sender: Any) {
        flag = 6;
        let pickerSix = UIImagePickerController();
        pickerSix.sourceType = .savedPhotosAlbum;
        pickerSix.allowsEditing = true;
        pickerSix.delegate = self;
        self.present(pickerSix, animated: true, completion: nil);
    }
    
    
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        
        if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            
            switch flag {
            case 1:
                imgOne.image = img;
            case 2:
                imgTwo.image = img;
            case 3:
                imgThree.image = img;
            case 4:
                imgFour.image = img;
            case 5:
                imgFive.image = img;
            case 6:
                imgSix.image = img;
                
            default:
                print ("error!")
            }
            
            
        }
        
//        imgOne.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage;
//        imgTwo.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage;
        picker.dismiss(animated: true, completion: nil);
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil);
        
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
