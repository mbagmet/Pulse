//
//  OnboardingPresenter.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import Foundation

class OnboardingPresenter {
    
    // MARK: - Properties
    
    weak var delegate: OnboardingPresenterDelegate?
    
    // MARK: - Configuration
    
    func setViewDelegate(delegate: OnboardingPresenterDelegate) {
        self.delegate = delegate
    }
}
