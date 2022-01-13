//
//  Dependency.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import Swinject

extension SceneDelegate {
    // TODO: - assembly 사용
    internal func setupDependencies() {
        container.register(ProfileViewController.self) { _ in
            ProfileViewController()
        }
        
        container.register(QRViewController.self) { _ in
            QRViewController()
        }
        
        container.register(WorkCommutingViewController.self) { _ in
            WorkCommutingViewController()
        }
    }
}
