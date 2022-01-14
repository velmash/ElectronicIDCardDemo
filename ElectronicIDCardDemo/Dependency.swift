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
        container.register(MainIDCardViewModel.self) { _ in
            MainIDCardViewModel()
        }
        
        container.register(ProfileViewModel.self) { _ in
            ProfileViewModel()
        }
        
        container.register(QRViewModel.self) { _ in
            QRViewModel()
        }
        
        container.register(WorkCommutingViewModel.self) { _ in
            WorkCommutingViewModel()
        }
        
        container.register(MainIDCardViewController.self) { resolver in
            let vc = MainIDCardViewController()
            vc.viewModel = resolver.resolve(MainIDCardViewModel.self)
            return vc
        }

        container.register(ProfileViewController.self) { resolver in
            let vc = ProfileViewController()
            vc.viewModel = resolver.resolve(ProfileViewModel.self)
            return vc
        }

        container.register(QRViewController.self) { resolver in
            let vc = QRViewController()
            vc.viewModel = resolver.resolve(QRViewModel.self)
            return vc
        }

        container.register(WorkCommutingViewController.self) { resolver in
            let vc = WorkCommutingViewController()
            vc.viewModel = resolver.resolve(WorkCommutingViewModel.self)
            return vc
        }
        
    }
}
