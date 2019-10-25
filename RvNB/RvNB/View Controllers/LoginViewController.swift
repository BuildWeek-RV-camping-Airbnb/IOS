//
//  LoginViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/23/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit
import CoreData

enum LoginType {
    
    case signUp
    case signIn
}

struct User: Codable {
    let email: String
    let password: String
}

enum Category: String, Codable {
    case Renter
    case Owner
}
class LoginViewController: UIViewController {
    
//    MARK: Outlets
    
    @IBOutlet weak var logoimageView: UIImageView!
    @IBOutlet weak var loginSegmentedController: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var areYouCateogorytextField: UITextField!
    
//    MARK: - Properties
    
    var apiController: APIController?
    var loginType = LoginType.signUp
    let cateogorytext:  UIPickerView = UIPickerView()
    let inputChoices: [Category] = [.Owner, .Renter]
    let layer = CAGradientLayer()
    
//    MARK: - View Cyle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        areYouCateogorytextField.inputView = cateogorytext
        cateogorytext.delegate = self as? UIPickerViewDelegate
        cateogorytext.dataSource = self as? UIPickerViewDataSource
       
        
        

        // Do any additional setup after loading the view.
    }
    
//    MARK: - Actions
    
    @IBAction func signInSegChanged(_ sender: Any) {
        
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            loginType = .signUp
            signInButton.setTitle("Sign Up", for: .normal)
            firstNameTextField.isHidden = false
            lastNameTextField.isHidden = false
            areYouCateogorytextField.isHidden = false
            usernameTextField.isHidden = false
            emailTextField.isHidden = false
        } else {
            loginType = .signIn
            signInButton.setTitle("Sign In", for: .normal)
            firstNameTextField.isHidden = true
            lastNameTextField.isHidden = true
            areYouCateogorytextField.isHidden = true
            usernameTextField.isHidden = false
            emailTextField.isHidden = true
            
        }
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let categoryText = areYouCateogorytextField.text,
            let category = Category(rawValue: categoryText),
        email != "",
            !password.isEmpty else { return }
        
        let user = User(email: email, password: password)
        
        
    }

// MARK: - Methods

   
}
// MARK: - Extensions

extension LoginViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inputChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return inputChoices[row].rawValue
    }
    
}




extension LoginViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        areYouCateogorytextField.text = inputChoices[row].rawValue
    }
}

