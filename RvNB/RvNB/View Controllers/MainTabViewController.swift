//
//  MainTabViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit
import CoreData

class MainTabViewController: UIViewController {
    
    var bearer: Bearer?
    var apiController: APIController?
    

//    MARK: Outlets
    
    @IBOutlet weak var rvnbSearchBar: UISearchBar!
    @IBOutlet weak var rvnbImage: UIImageView!
    @IBOutlet weak var topRatedStays: UICollectionView!
    @IBOutlet weak var listOfStays: UICollectionView!
    
    
    
    
// MARK: View Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        transitions to login view if conditions require
        if bearer == nil {
            performSegue(withIdentifier: "LoginTestSegue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topRatedStays.delegate = self as? UICollectionViewDelegate
        topRatedStays.dataSource = self as? UICollectionViewDataSource
        listOfStays.delegate = self as? UICollectionViewDelegate
        listOfStays.dataSource = self as? UICollectionViewDataSource
        
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

extension MainTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
//     set up for both collectionviews
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topRatedStays {
            let cell: TopStaysCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedStaysCell", for: indexPath) as? TopStaysCollectionViewCell)!
            
//            cell.imageView.image = UIImage(named: places[indexPath.row])
            
            return cell
        }
        
        else{
        
            let cell: ListOfStaysCollectionViewCell =
            (collectionView.dequeueReusableCell(withReuseIdentifier: "StaysCell", for: indexPath) as? ListOfStaysCollectionViewCell)!
            
//            cell.imageView.image = UIImage(named: places[indexPath.row])
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

}
