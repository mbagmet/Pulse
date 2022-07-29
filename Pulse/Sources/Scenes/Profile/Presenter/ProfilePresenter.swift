//
//  ProfilePresenter.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import Foundation

class ProfilePresenter: ProfileManager {
    
    // MARK: - Properties
    
    weak var delegate: ProfilePresenterDelegate?
    
    // MARK: - Configuration
    
    func setViewDelegate(delegate: ProfilePresenterDelegate) {
        self.delegate = delegate
    }
}
