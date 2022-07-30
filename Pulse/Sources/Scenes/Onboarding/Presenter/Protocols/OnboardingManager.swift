//
//  OnboardingManager.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import Foundation

protocol OnboardingManager {
    var delegate: OnboardingPresenterDelegate? { get set }
    
    func setViewDelegate(delegate: OnboardingPresenterDelegate)
}
