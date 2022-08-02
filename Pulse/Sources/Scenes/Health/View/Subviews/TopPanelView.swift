//
//  TopPanelView.swift
//  Pulse
//
//  Created by Михаил Багмет on 30.07.2022.
//

import UIKit
import SnapKit

class TopPanelView: UIView {
    
    // MARK: - Views

    private lazy var topPanelStackView = UIStackView.createStackView(axis: .horizontal, distribution: .fill, spacing: Metrics.topPanelStackViewSpacing)

    private lazy var bloodPressureButton = createButton(title: "Blood pressure", imageName: "blood", tintColor: UIColor(named: "IconGreen"))
    private lazy var oxygenButton = createButton(title: "Oxygen", imageName: "oxygen", tintColor: UIColor(named: "IconBlue"))
    private lazy var heartRateButton = createButton(title: "Heart rate", imageName: "heart", tintColor: UIColor(named: "MainRed"))

    // MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings
    
    private func setupView() {
        self.backgroundColor = UIColor(named: "SecondaryLight")
        
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = Metrics.topPanelCornerRadius
    }
    
    private func setupHierarchy() {
        self.addSubview(topPanelStackView)
        
        topPanelStackView.addArrangedSubview(bloodPressureButton)
        topPanelStackView.addArrangedSubview(oxygenButton)
        topPanelStackView.addArrangedSubview(heartRateButton)
    }

    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(Metrics.topPanelHeight)
        }
        
        topPanelStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: CommonMetrics.lightGrayPanelsInset,
                                                             left: CommonMetrics.lightGrayPanelsInset,
                                                             bottom: CommonMetrics.lightGrayPanelsInset,
                                                             right: CommonMetrics.lightGrayPanelsInset))
        }
    }
    
    // MARK: - Private Functions
    
    private func createButton(title: String, imageName: String, tintColor: UIColor?) -> UIButton {
        var container = AttributeContainer()
        container.font = Metrics.topPanelFont
        
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.titleAlignment = .center
        configuration.contentInsets = NSDirectionalEdgeInsets(top: Metrics.topPanelItemTopInset,
                                                              leading: Metrics.topPanelItemHorizontalInset,
                                                              bottom: Metrics.topPanelItemBottomInset,
                                                              trailing: Metrics.topPanelItemHorizontalInset)
        
        configuration.image = UIImage(named: imageName)
        configuration.imagePlacement = .top
        configuration.imagePadding = 0
        
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = tintColor
        configuration.background.cornerRadius = Metrics.topPanelItemCornerRadius
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.imageView?.snp.makeConstraints { make in
            make.top.equalTo(Metrics.topPanelItemTopInset)
            make.centerX.equalToSuperview()
            make.height.equalTo(CommonMetrics.smallIconSize)
            make.width.equalTo(CommonMetrics.smallIconSize)
        }
        
        return button
    }
}

// MARK: - Constatnts

extension TopPanelView {
    enum Metrics {
        static let topPanelStackViewSpacing: CGFloat = 5
        
        static let topPanelHeight: CGFloat = 82
        static let topPanelCornerRadius: CGFloat = 23
        
        static let topPanelItemCornerRadius: CGFloat = 16
        
        static let topPanelItemTopInset: CGFloat = 11
        static let topPanelItemHorizontalInset: CGFloat = 5
        static let topPanelItemBottomInset: CGFloat = 18
        
        static let topPanelFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
}
