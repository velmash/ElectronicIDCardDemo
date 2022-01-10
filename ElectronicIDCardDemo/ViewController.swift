//
//  ViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var idView = MainIDView()
//    var profileView = ProfileView()
    
    @IBAction func doTestButtonTap(_ sender: Any) {
        // 서브 뷰 넣기
        self.view.addSubview(idView)
//        self.idView.scrollView.addSubview(profileView)
        ttt()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hi")
    }
    
    func ttt() {
        idView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
//        profileView.snp.remakeConstraints {
//            $0.edges.equalToSuperview()
//        }
    }
}

