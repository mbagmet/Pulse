//
//  HealthViewController.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import UIKit

class HealthViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter = HealthPresenter()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Presenter setup
        presenter.setViewDelegate(delegate: self)
        
        // MARK: Navigaiton Setup
        setupNavigation()
        
        // MARK: View Setup
        view.backgroundColor = .systemBackground
    }
}

// MARK: - Presenter Delegate

extension HealthViewController: HealthPresenterDelegate {

}

// MARK: - Navigation

extension HealthViewController {
    private func setupNavigation() {
        navigationItem.title = Strings.healthNavigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        navItem.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(presentSettings), image: UIImage(systemName: "gearshape.fill"))
    }
}

// MARK: - User Actions

extension HealthViewController {
    @objc func presentSettings() {
        // TODO
    }
}
