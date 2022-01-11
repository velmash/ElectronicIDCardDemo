//
//  HorizontalScrollView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/11.
//

import Foundation
import UIKit
import SnapKit

class HorizontalScrollView: BaseScrollView {
    static func instance() -> HorizontalScrollView {
        return HorizontalScrollView()
    }
    var dataSource: [SomeDataModel]? {
        didSet { bind() }
    }
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.axis = .horizontal
        //        view.spacing = 16.0
//        view.backgroundColor = .separator
        
        return view
    }()
    
    override func configure() {
        super.configure()
        
        showsHorizontalScrollIndicator = false
        bounces = false
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(1)
        }
    }
    
    override func bind() {
        super.bind()
        
        dataSource?.forEach { data in
            stackView.addArrangedSubview(data.view)
            
            data.view.snp.remakeConstraints { make in
                make.width.equalTo(300)
            }
        }
    }
}
