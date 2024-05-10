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
}

extension SignupViewController:SignupViewDelegategateProtocol{
    func successfullSignup() {
        
    }
    
    func errorHandler(error: SignupError) {
        
    }
}
