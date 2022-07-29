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
        
        // MARK: View Setup
        view.backgroundColor = .systemBackground
    }
}

// MARK: - Presenter Delegate

extension HealthViewController: HealthPresenterDelegate {

}

