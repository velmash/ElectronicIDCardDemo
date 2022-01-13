//
//  MainIDCardViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import CombineCocoa

class MainIDCardViewController: BaseViewController<MainIDCardView> {
    private let profileVC = ProfileViewController()
    private let qrVC = QRViewController()
    private let workCommutingVC = WorkCommutingViewController()
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    lazy private var pages: [UIViewController] = {
        return [profileVC, qrVC, workCommutingVC]
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageController()
        setupPageControl()
        setupButton()
        setupToast()
    }
    
    
    func setupPageController() {
        ViewEmbedder.embed(parent: self, container: myView.pageContainerView , child: pageViewController, previous: nil)
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        guard let startViewController = pages.first(where: { $0 is QRViewController }) else { return }
        pageViewController.setViewControllers([startViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func setupPageControl() {
        myView.pageControl.numberOfPages = pages.count
        myView.pageControl.currentPage = pages.firstIndex(of: qrVC) ?? 0
    }
    
    func setupButton() {
        myView.backButton.tapPublisher
            .sink { self.dismiss(animated: false, completion: nil) }
            .store(in: &bag)
    }
    
    func setupToast() {
        workCommutingVC.toastViewTrigger
            .sink { [weak self] in
                self?.showToast(message: "이미 출근시간이 등록되었습니다.", font: .systemFont(ofSize: 14))
            }
            .store(in: &bag)
    }
}

extension MainIDCardViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        var currentIndex = 0
        if let currentVC = pageViewController.viewControllers?.first,
           let index = pages.firstIndex(of: currentVC) {
            currentIndex = index
        }
        myView.pageControl.currentPage = currentIndex
    }
}

// MARK: - UIPageViewControllerDataSource
extension MainIDCardViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == pages.count {
            return nil
        }
        return pages[nextIndex]
    }
}
