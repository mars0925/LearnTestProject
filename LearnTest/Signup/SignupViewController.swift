//
//  SignupViewController.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/5/8.
//

import UIKit

class SignupViewController: UIViewController{
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    var signupPresenter:SignupPresenterProtocol?
    @IBOutlet weak var nextPageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if signupPresenter == nil {
            signupPresenter = SignupPresenter(formModelValidator: SignUpFromModelValidator()
                                              , signupService: SignupWebService(urlString: login_url),
                                              delegate: self)
        }

        
    }
    
    @IBAction func tap(_ sender: UIButton) {
        let model = SignupForModel(unid: "", pwd: "", role: "",
                       firstName: userFirstNameTextField.text ?? "",
                       lastName: lastNameTextField.text ?? "",
                       email: emailTextField.text ?? "",
                       password: passwordTextField.text ?? "",
                       reapPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: model)
    }
    
    @IBAction func pushNextViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondViewController") as SecondViewController
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}

extension SignupViewController:SignupViewDelegategateProtocol{
    func successfullSignup() {
        
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "type wrong information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.view.accessibilityIdentifier = "errorAlertDialog"
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
