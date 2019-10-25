//
//  LoginViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/23/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

enum LoginType {
    
    case signUp
    case signIn
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        areYouCateogorytextField.inputView = cateogorytext
        cateogorytext.delegate = self as UIPickerViewDelegate
        cateogorytext.dataSource = self as UIPickerViewDataSource
        
        createToolbar()

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
            emailTextField.isHidden = true
        }
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if loginSegmentedController.selectedSegmentIndex == 0 {
            if let firstName = firstNameTextField.text,
                !firstName.isEmpty,
                let lastName = lastNameTextField.text,
                !lastName.isEmpty,
                let email = emailTextField.text,
                let username = usernameTextField.text,
                !username.isEmpty,
                let password = passwordTextField.text,
                let categoryText = areYouCateogorytextField.text,
                let category = Category(rawValue: categoryText),
                email != "",
                !password.isEmpty {
                APIController.shared.createUser(firstName: firstName, lastName: lastName, email: email, username: username, password: password, owner: false, avatar: nil)
                let alert = UIAlertController(title: "Great! 😎", message: "Now please sign in!", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
                
                loginSegmentedController.selectedSegmentIndex = 1
                signInSegChanged(loginSegmentedController!)
            } else {
                let alert = UIAlertController(title: "Oops!", message: "Please fill out all the fields in order to sign up", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
            }
        } else {
            if let username = usernameTextField.text,
                let password = passwordTextField.text,
                !username.isEmpty,
                !password.isEmpty {
                APIController.shared.login(username: username, password: password)
                navigationController?.popViewController(animated: true)
            } else {
                let alert = UIAlertController(title: "Sorry! 😬", message: "Username and password fields must be filled out to log in", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
            }
        }
        
//        let user = User(email: email, password: password)
        
        
    }
    
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(LoginViewController.dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        areYouCateogorytextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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

