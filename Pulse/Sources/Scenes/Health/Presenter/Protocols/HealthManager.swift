//
//  HealthManager.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import Foundation

protocol HealthManager {
    var delegate: HealthPresenterDelegate? { get set }
    
    func setViewDelegate(delegate: HealthPresenterDelegate)
    func configureView()
}
