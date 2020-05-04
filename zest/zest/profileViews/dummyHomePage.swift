////
////  dummyHomePage.swift
////  zest
////
////  Created by Rohit Sai Gopal on 5/2/20.
////  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
////
//
//import UIKit
//import Firebase
//import FirebaseFirestore
//import FirebaseAuth
//
//class dummyHomePage: UIViewController {
//    @IBOutlet weak var labelLabel: UILabel!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let user = Auth.auth().currentUser
//        let email = user?.email
//        let db = Firestore.firestore()
//        let docRef = db.collection("Users").document(email!) //using email to find our user
//
//               docRef.getDocument { (document, error) in
//                   if let document = document, document.exists {
//                       let dataDescription = document.data().map(String.init(describing:)) ?? "nils"
//                       print("Document data: \(dataDescription)")
//                    print(type(of: dataDescription))
//                    
//                    self.labelLabel.text =  email   //i am trying to print separate properties of the user here but I cannot seem to parse the individual data from the String
//                    
//                   } else {
//                       print("Document does not exist")
//                   }
//               }
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
