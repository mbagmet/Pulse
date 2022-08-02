//
//  HealthViewController.swift
//  Pulse
//
//  Created by Михаил Багмет on 29.07.2022.
//

import UIKit
import SnapKit

class HealthViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter = HealthPresenter()
    
    // MARK: - Views
    
    private lazy var scrollview = UIScrollView()
    
    private lazy var mainContainer = UIView()
    
    private lazy var mainStackView = UIStackView.createStackView(axis: .vertical, distribution: .fill, spacing: Metrics.mainStackViewSpacing)
    private lazy var topPanelContainer = TopPanelView()
    private lazy var measureContainer = MeasureView()
    private lazy var dailyAdviceContainer = DailyAdviceView()
    
    //private lazy var mainStackView = createStackView(axis: .vertical, distribution: .fill, spacing: 10)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Presenter setup
        presenter.setViewDelegate(delegate: self)
        presenter.configureView()
        
        // MARK: Navigaiton Setup
        setupNavigation()
        
        // MARK: View Setup
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        view.addSubview(scrollview)
        scrollview.addSubview(mainContainer)
        
        mainContainer.addSubview(mainStackView)
        mainStackView.addArrangedSubview(topPanelContainer)
        mainStackView.addArrangedSubview(measureContainer)
        mainContainer.addSubview(dailyAdviceContainer)
    }
    
    private func setupLayout() {
        scrollview.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        mainContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(CommonMetrics.leadingOffset)
            make.trailing.equalToSuperview().offset(CommonMetrics.trailingOffset)
            make.bottom.equalToSuperview()
            make.width.equalTo(view).offset((CommonMetrics.trailingOffset - CommonMetrics.leadingOffset))
            make.height.equalTo(view)
        }
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
            //make.bottom.equalToSuperview()
        }
        
        dailyAdviceContainer.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(Metrics.dailyAdviceContainerTopOffset)
            make.leading.equalToSuperview().offset(CommonMetrics.leadingOffset * 2)
            make.trailing.equalToSuperview().offset(CommonMetrics.trailingOffset * 2)
        }
    }
    
    // MARK: - Private functions
    
    private func createRoundedView(cornerRadius: CGFloat, backgroundColor: UIColor?) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        
        return view
    }
    
//    private func createImageView(imageName: String, width: CGFloat, height: CGFloat) -> UIImageView {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: imageName)
//        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
//        imageView.backgroundColor = .systemMint
//
//        return imageView
//    }
}

// MARK: - Presenter Delegate

extension HealthViewController: HealthPresenterDelegate {
    func showAdvice(advice: DailyAdvice) {
        dailyAdviceContainer.text.attributedText = NSAttributedString(string: advice.description).withLineSpacing(3)
    }
}

// MARK: - Navigation

extension HealthViewController {
    private func setupNavigation() {
        navigationItem.title = CommonStrings.healthNavigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(presentSettings), image: UIImage(systemName: "gearshape.fill"))
    }
}

// MARK: - User Actions

extension HealthViewController {
    @objc func presentSettings() {
        // TODO
    }
}

// MARK: - Constatnts

extension HealthViewController {
    enum Metrics {
        static let mainStackViewSpacing: CGFloat = 8
        
        static let dailyAdviceContainerTopOffset: CGFloat = 16
    }
}
