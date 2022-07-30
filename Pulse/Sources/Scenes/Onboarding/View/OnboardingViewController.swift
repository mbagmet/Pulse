//
//  OnboardingViewController.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter = OnboardingPresenter()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Presenter setup
        presenter.setViewDelegate(delegate: self)
        
        // MARK: View Setup
        view.backgroundColor = .systemYellow
    }
}

// MARK: - Presenter Delegate

extension OnboardingViewController: OnboardingPresenterDelegate {
    
}
