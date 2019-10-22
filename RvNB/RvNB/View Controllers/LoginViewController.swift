//
//  LoginViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/22/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
//    MARK: Outlets
    @IBOutlet weak var topConstraintHeight: NSLayoutConstraint!
    
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    
//    MARK: ACTIONS
    @IBAction func hideSigninPop(_ sender: UIButton) {
        topConstraintHeight.constant = 800;
        logoTopConstraint.constant = 187;
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.view.layoutIfNeeded() }, completion: nil)
        print("clicked")
        
    }
    
    
    @IBAction func ShowSignInPop(_ sender: Any) {
        
    topConstraintHeight.constant = 0;
        logoTopConstraint.constant = 100;
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.view.layoutIfNeeded() }, completion: nil)
        print("clicked")
    }
    
    
    
    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topConstraintHeight.constant = 800;
        logoTopConstraint.constant = 187;
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
