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
    
    func configureView() {
        guard let advice = getAdvice() else { return }
        delegate?.showAdvice(advice: advice)
    }
    
    // MARK: - Private functions
    
    private func getAdvice() -> DailyAdvice? {
        guard let advices = DailyAdviceModel.createModel() else { return nil }
        return advices.last
    }
}
