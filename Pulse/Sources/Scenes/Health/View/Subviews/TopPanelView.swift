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

    private lazy var topPanelStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5

        return stackView
    }()

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
        self.layer.cornerRadius = 23
    }
    
    private func setupHierarchy() {
        self.addSubview(topPanelStackView)
        
        topPanelStackView.addArrangedSubview(bloodPressureButton)
        topPanelStackView.addArrangedSubview(oxygenButton)
        topPanelStackView.addArrangedSubview(heartRateButton)
    }

    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(82)
        }
        
        topPanelStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
    }
    
    // MARK: - Private Functions
    
    private func createButton(title: String, imageName: String, tintColor: UIColor?) -> UIButton {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.titleAlignment = .center
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 5, bottom: 18, trailing: 5)
        
        configuration.image = UIImage(named: imageName)
        configuration.imagePlacement = .top
        configuration.imagePadding = 0
        
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = tintColor
        configuration.background.cornerRadius = 16
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.imageView?.snp.makeConstraints { make in
            make.top.equalTo(11)
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
            make.width.equalTo(28)
        }
        
        return button
    }
}
