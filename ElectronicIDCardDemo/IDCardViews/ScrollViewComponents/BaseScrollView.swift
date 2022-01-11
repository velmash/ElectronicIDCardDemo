//
//  BaseScrollView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/11.
//

import Foundation
import UIKit

class BaseScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemeted xib")
    }

    func configure() {}
    func bind() {}
}
