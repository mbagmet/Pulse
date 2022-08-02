//
//  DailyAdviceView.swift
//  Pulse
//
//  Created by Михаил Багмет on 30.07.2022.
//

import UIKit

class DailyAdviceView: UIView {

    // MARK: - Views
    
    private lazy var headerStackView = UIStackView.createStackView(axis: .horizontal, distribution: .fill, spacing: Metrics.headerStackViewSpacing)
    
    private lazy var titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "advice")
        imageView.frame = CGRect(x: 0, y: 0, width: CommonMetrics.smallIconSize, height: CommonMetrics.smallIconSize)

        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = CommonStrings.dailyAdviceTitle.uppercased()
        label.font = CommonMetrics.subtitleFont
        label.textColor = UIColor(named: "MainBlack")

        return label
    }()
    
    lazy var text: UILabel = {
        let label = UILabel()
        label.font = Metrics.adviceFont
        label.textColor = UIColor(named: "SecondaryGray")
        label.numberOfLines = 0

        return label
    }()

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
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings
    
    private func setupHierarchy() {
        self.addSubview(headerStackView)

        headerStackView.addArrangedSubview(titleImage)
        headerStackView.addArrangedSubview(title)

        self.addSubview(text)
    }

    private func setupLayout() {
        headerStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        text.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(Metrics.adviceTextTopOffset)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        titleImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(CommonMetrics.smallIconSize)
            make.width.equalTo(CommonMetrics.smallIconSize)
        }
    }
}

// MARK: - Constatnts

extension DailyAdviceView {
    enum Metrics {
        static let headerStackViewSpacing: CGFloat = 4
        static let adviceTextTopOffset: CGFloat = 11
        
        static let adviceFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    }
}
