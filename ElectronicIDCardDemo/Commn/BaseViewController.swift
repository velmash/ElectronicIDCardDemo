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
}
