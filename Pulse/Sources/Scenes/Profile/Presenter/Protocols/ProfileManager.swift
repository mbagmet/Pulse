//
//  ProfileManager.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import Foundation

protocol ProfileManager {
    var delegate: ProfilePresenterDelegate? { get set }
    
    func setViewDelegate(delegate: ProfilePresenterDelegate)
}
