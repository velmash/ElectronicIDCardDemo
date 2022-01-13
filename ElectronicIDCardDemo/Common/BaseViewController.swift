//
//  BaseViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import Combine

class BaseViewController<CustomView: BaseView>: UIViewController {
    
    // MARK: - Properties
    lazy var myView: CustomView = {
        return view as! CustomView
    }()
    var bag = Set<AnyCancellable>()
    
    
    // MARK: - View Lifecycle
    override func loadView() {
        view = CustomView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageBinding()
    }
    
    func pageBinding() { }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel().then {
            $0.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            $0.textColor = UIColor.white
            $0.font = font
            $0.textAlignment = .center;
            $0.text = message
            $0.alpha = 1.0
            $0.layer.cornerRadius = 10;
            $0.clipsToBounds = true
        }
        
        self.view.addSubview(toastLabel)
        toastLabel.snp.remakeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(35)
            $0.centerX.equalToSuperview()
        }
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview() })
    }

}
