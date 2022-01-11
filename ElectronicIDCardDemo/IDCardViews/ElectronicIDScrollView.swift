//
//  ElectronicIDScrollView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import Combine
import SnapKit

class ElectronicIDScrollView: UIScrollView {
    private var bag = Set<AnyCancellable>()
    let pageCount = CurrentValueSubject<Int?, Never>(nil)
    
    static func instance() -> ElectronicIDScrollView {
        return ElectronicIDScrollView()
    }
    
    lazy var stackView = createStackView()
    private let components = [ProfileView(), QRView()]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        showsHorizontalScrollIndicator = false
        bounces = false
        self.isPagingEnabled = true
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(1)
        }
        
        for view in components {
            stackView.addArrangedSubview(view)
            view.snp.remakeConstraints {
                $0.width.equalTo(300)
            }
        }
        
        self.pageCount.send(components.count)
    }
}
