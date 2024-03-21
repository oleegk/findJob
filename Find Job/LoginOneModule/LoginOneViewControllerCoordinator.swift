//
//  LoginViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class LoginOneViewControllerCoordinator: BaseCoordinator {
    
    weak var parentCoordinator: TabBarCoordinator?
    var navigationController = UINavigationController()
    let loginOneViewModel = LoginOneViewModel()
    
    override func start() {
        let loginOneViewController = LoginOneViewController()
        loginOneViewController.viewModel = loginOneViewModel
        loginOneViewModel.coordinator = self
        loginOneViewModel.updateBudge()
        navigationController.viewControllers = [loginOneViewController]
    }
    
    func openLoginTwoScreen(_ email: String){
        let loginTwoViewControllerCoordinator = LoginTwoViewControllerCoordinator()
        loginTwoViewControllerCoordinator.navigationController = navigationController
        add(coordinator: loginTwoViewControllerCoordinator)
        loginTwoViewControllerCoordinator.start()
        loginTwoViewControllerCoordinator.loginTwoViewModel.email = email
        loginTwoViewControllerCoordinator.loginTwoViewModel.tabBarController = parentCoordinator?.tabBarController
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === childCoordinator {
                print("Удален координатор childCoordinator из ТаБарКоординатора")
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
