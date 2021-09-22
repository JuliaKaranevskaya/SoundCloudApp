//
//  ViewController.swift
//  SoundCloudApp
//
//  Created by Юлия Караневская on 22.09.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
        hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setButtonInActiveColor), name: Notification.Name("active"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setButtonOutOfInActiveColor), name: Notification.Name("inactive"), object: nil)
    }
    
    @objc func setButtonInActiveColor() {
        loginButton.setBackgroundImage(UIImage(named: "loginActive"), for: .normal)
    }
    
    @objc func setButtonOutOfInActiveColor() {
        loginButton.setBackgroundImage(UIImage(named: "loginInactive"), for: .normal)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        guard let login = loginTextField, let password = passwordTextField else {
            return
        }
        
        if login.text!.count >= 6, password.text!.count >= 6 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "active"), object: nil)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "inactive"), object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
    
    
}

