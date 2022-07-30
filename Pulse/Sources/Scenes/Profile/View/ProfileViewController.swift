//
//  ProfileViewController.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter = ProfilePresenter()
    
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

extension ProfileViewController: ProfilePresenterDelegate {
    
}

// MARK: - Navigation

extension ProfileViewController {
    private func setupNavigation() {
        navigationItem.title = Strings.profileNavigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
