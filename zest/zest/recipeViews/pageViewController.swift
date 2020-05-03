//
//  pageViewController.swift
//  zest
//
//  Created by Yuet Yu Melody Lam  on 5/3/20.
//  Copyright © 2020 Yuet Yu Melody Lam . All rights reserved.
//

import UIKit

class pageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var VCList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "ingredientVC")
        let vc2 = sb.instantiateViewController(withIdentifier: "instructionsVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "reviewsVC")
        
        return [vc1,vc2, vc3]
    }()
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCList.firstIndex(of: viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else { return nil}
        guard VCList.count > previousIndex else {return nil}
        
        return VCList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCList.firstIndex(of: viewController) else { return nil}
        
        let nextIndex = vcIndex + 1
        guard VCList.count != nextIndex else {return nil}
        guard VCList.count > nextIndex else { return nil}
        
        return VCList[nextIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = VCList.first {
            self.setViewControllers([firstViewController], direction: .forward , animated: true, completion: nil)
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
