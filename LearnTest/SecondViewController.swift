//
//  SecondViewController.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/5/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func dissmiss(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
