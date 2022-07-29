//
//  HealthPresenter.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import Foundation

class HealthPresenter: HealthManager {
    
    // MARK: - Properties
    
    weak var delegate: HealthPresenterDelegate?
    
    // MARK: - Configuration
    
    func setViewDelegate(delegate: HealthPresenterDelegate) {
        self.delegate = delegate
    }
}
