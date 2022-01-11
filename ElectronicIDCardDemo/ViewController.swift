//
//  ViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var mainIDCardView = MainIDView()
    
    @IBAction func doTestButtonTap(_ sender: Any) {
        // 서브 뷰 넣기
        self.view.addSubview(mainIDCardView)
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hi")
    }
    
    func setConstraints() {
        mainIDCardView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

