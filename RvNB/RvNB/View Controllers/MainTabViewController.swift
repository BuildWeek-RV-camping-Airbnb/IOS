//
//  MainTabViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class MainTabViewController: UIViewController {
    
    var bearer: Bearer?

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
    }
    
    private struct StoryBoard {
        static let CellIdentifier = "Cell"
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TopStaysCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemIndexPath indexPath: NSIndexPath) ->  UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        return cell
    }
    
}
