//
//  ViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var mainVC = MainIDCardViewController()
    
    @IBAction func doTestButtonTap(_ sender: Any) {
        mainVC.modalPresentationStyle = .overFullScreen
        mainVC.myView.alpha = 1
        present(mainVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

