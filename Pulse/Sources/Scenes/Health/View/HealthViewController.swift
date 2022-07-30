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
    private lazy var mainStackView = createStackView(axis: .vertical, distribution: .fill, spacing: Metrics.mainStackViewSpacing)
    private lazy var topPanelContainer = TopPanelView()
    private lazy var measureContainer = MeasureView()
    
    //private lazy var mainStackView = createStackView(axis: .vertical, distribution: .fill, spacing: 10)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Presenter setup
        presenter.setViewDelegate(delegate: self)
        
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
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(topPanelContainer)
        mainStackView.addArrangedSubview(measureContainer)
    }
    
    private func setupLayout() {
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(Metrics.leadingOffset)
            make.trailing.equalToSuperview().offset(Metrics.trailingOffset)
        }
    }
    
    // MARK: - Private functions

    func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing

        return stackView
    }
    
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
//
//    private func createLabel(text: String, color: UIColor?) -> UILabel {
//        let label = UILabel()
//        label.text = text
//        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
//        label.textColor = color
//
//        return label
//    }
}

// MARK: - Presenter Delegate

extension HealthViewController: HealthPresenterDelegate {

}

// MARK: - Navigation

extension HealthViewController {
    private func setupNavigation() {
        navigationItem.title = Strings.healthNavigationTitle
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
        static let leadingOffset: CGFloat = 8
        static let trailingOffset: CGFloat = -8
    }
}
