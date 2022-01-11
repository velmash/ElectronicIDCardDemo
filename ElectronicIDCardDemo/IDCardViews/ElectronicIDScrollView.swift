//
//  ElectronicIDScrollView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import SnapKit

class ElectronicScrollView: UIScrollView, UIScrollViewDelegate {
    
    struct InnerViewType {
        enum ViewType: String {
            case profile
            case QR
        }
        
        let type: ViewType
        
        var name: String {
            return type.rawValue
        }
        
        var view: UIView {
            switch type {
            case .profile: return ProfileView()
            case .QR: return QRView()
            }
        }
    }
    
    struct Mocks {
        static func getDataSource() -> [InnerViewType] {
            return [InnerViewType(type: .profile),
                    InnerViewType(type: .QR)]
        }
    }
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 16.0
        view.backgroundColor = .separator
        
        return view
    }()
    
    var dataSource: [InnerViewType]? {
        didSet { bind() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        bind()
        //        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        showsHorizontalScrollIndicator = false
        bounces = false
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview() /// 이 값이 없으면 scroll 안되는 것 주의
            make.top.bottom.equalToSuperview()
        }
    }
    
    func bind() {
        dataSource?.forEach { ds in
            stackView.addArrangedSubview(ds.view)
            stackView.addArrangedSubview(ds.view)
            ds.view.snp.makeConstraints { make in
                make.height.equalTo(42)
            }
        }
    }
}

extension UIScrollViewDelegate {
    
}
