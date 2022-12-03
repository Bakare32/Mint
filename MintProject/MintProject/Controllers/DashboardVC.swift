//
//  DashboardVC.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit

var BOTTOM_SAFEAREA_HEIGHT = 0.0

class DashboardVC: UIViewController {
    
    var coordinator: MainCoordinator?
    
    var pages = [UIViewController]()
    var viewControllers: [UIViewController]?
    var prevIndex: Int = 0
    private var pageController: UIPageViewController?
    private let pageView = UIView().manualLayoutable()
    var dashTabController = DashTabBar().manualLayoutable()
    var selectedPage: Int?
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
       configureUI()
    }
    
    // MARK: - Visual Setup
    
    private func configureUI() {
        setBackgroundColor()
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
        loadTabPages()
    }
    
    private func setUpProperties() {
        
        dashTabController = DashTabBar(selectedIndex: 0).manualLayoutable()
        dashTabController.btnAction = {
            debugPrint("Selected Index -> ",self.dashTabController.selectedIndex)
            self.selectedPage = self.dashTabController.selectedIndex
            self.selectPage(at: self.selectedPage ?? 0)
        }
        
        pageView.apply {
            $0.backgroundColor = TRANSPARENT
        }
        
    }
    
    private func setupHierarchy() {
        
        view.addSubview(pageView)
        view.addSubview(dashTabController)
        
    }
    
    private func setUpAutoLayout() {
        
        pageView.apply {
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.topAnchor.constraint(equalTo: view.topAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        }
        
        dashTabController.apply {
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: BOTTOM_SAFEAREA_HEIGHT + 106).activate()
        }
        
    }
    
    private func createCenterPageViewController() -> UIPageViewController? {
        
        let homePage = HomeViewController()
        let transactionPage = TransactionsPage()
        let morePage = MorePage()
        let supportPage = SupportPage()
         let settingsPage = SettingsPage()
        
        homePage.view.tag = 0
        transactionPage.view.tag = 1
        morePage.view.tag = 2
        supportPage.view.tag = 3
         settingsPage.view.tag = 4
        
        homePage.coordinator = coordinator
        transactionPage.coordinator = coordinator
        morePage.coordinator = coordinator
        supportPage.coordinator = coordinator
        settingsPage.coordinator = coordinator
        
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pages = [homePage, transactionPage, morePage, supportPage, settingsPage]
        pageController?.view.tag = 0
        pageController?.delegate = self
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.pageView.frame.width,height: self.pageView.frame.height)
        pageView.addSubview(self.pageController!.view)
        
        return pageController
    }
    
    private func createPlaceholderViewController(forIndex index: Int) -> UIViewController {
        let emptyViewController = UIViewController()
        emptyViewController.view.tag = index
        return emptyViewController
    }
    
    func loadTabPages() {
        guard let firstPageViewController = createCenterPageViewController() else { return }
        
        var controllers: [UIViewController] = []
        
        controllers.append(firstPageViewController)
        controllers.append(createPlaceholderViewController(forIndex: 1))
        controllers.append(createPlaceholderViewController(forIndex: 2))
        controllers.append(createPlaceholderViewController(forIndex: 3))
        controllers.append(createPlaceholderViewController(forIndex: 4))
//        controllers.append(createPlaceholderViewController(forIndex: 5))
        
        viewControllers = controllers
        
        selectMenuPage(at: selectedPage ?? 0)
    }
    
    func pageDidSwipe(to index: Int) {
        debugPrint("Selected Index -> ",index)
        self.selectedPage = index
        self.dashTabController.selectedIndex = index
        self.dashTabController.setupButtons()
    }
    
    func direction(for index: Int) -> UIPageViewController.NavigationDirection {
        return index > self.prevIndex ? .forward : .reverse
    }
    
    func selectPage(at index: Int) {
        self.pageController?.setViewControllers(
            [self.pages[index]],
            direction: self.direction(for: index),
            animated: false,
            completion: nil
        )
        self.prevIndex = index
    }
    
    func selectMenuPage(at index: Int) {
        if index == 0 {
//            setObserver()
        }
        selectPage(at: index)
    }
    


}


extension DashboardVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return nil }
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let currentPageIndex = self.viewControllers?.first?.view.tag else { return }
            self.prevIndex = currentPageIndex
            //pageDidSwipe(to: currentPageIndex)
            if let viewControllers = pageViewController.viewControllers {
                if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                    pageDidSwipe(to: viewControllerIndex)
                }
            }
        }
        
    }
    
    // Enables pagination dots
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    // This only gets called once, when setViewControllers is called
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
