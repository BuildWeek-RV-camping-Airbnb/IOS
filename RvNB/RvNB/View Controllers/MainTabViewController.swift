//
//  MainTabViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    
    @IBOutlet weak var rvnbImage: UIImageView!
    @IBOutlet weak var topRatedStays: UICollectionView!
    @IBOutlet weak var listOfStays: UICollectionView!
    
    

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
