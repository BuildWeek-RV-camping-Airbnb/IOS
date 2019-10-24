//
//  LoginPopupViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/23/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

struct User: Codable{
    let email: String
    let password: String
}

enum LoginType {
    case signUp
    case signIn
}

class LoginPopupViewController: UIViewController {
    
//    MARK: - Properties
    
    var apiController: APIController?
    var loginType = LoginType.signUp
    var user: User?
    var buttonTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
//    MARK: - Actions
    
    
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        
//        create user
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
        email != "",
            !password.isEmpty else { return }
        
        let user = User(email: email, password: password)
        
//        perform login or sign up operation based on loginType
        
//       SignUpModalSegue, SignInModalSegue
        self.performSegue(withIdentifier: "SignUpModalSegue", sender: self)
        if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
            print("Sign Up")
        }
        else {
            self.performSegue(withIdentifier: "SignInModalSegue", sender: self)
            if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
            print("Sign In")
        }
        
        
    }
    
//    MARK: - Methods
    
    func signIn(with: User) {
        
    }
    
    func signUp(with: User) {
        
        
        
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
}
