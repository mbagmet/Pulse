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
        
        // MARK: View Setup
        view.backgroundColor = .systemTeal
    }
}

// MARK: - Presenter Delegate

extension ProfileViewController: ProfilePresenterDelegate {
    
}
