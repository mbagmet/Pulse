//
//  MeasureView.swift
//  Pulse
//
//  Created by Михаил Багмет on 30.07.2022.
//

import UIKit
import SnapKit

class MeasureView: UIView {

    // MARK: - Views
    
    lazy var heartImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondarySystemBackground
        imageView.image = UIImage(named: "heart")
        imageView.frame = CGRect(x: 0, y: 0, width: 68, height: 68)
        
//        imageView.clipsToBounds = true
//        imageView.layer.masksToBounds = true
//        imageView.layer.cornerRadius = Metrics.imageSize / 2
//        imageView.layer.borderWidth = Metrics.imageBorderWidth
        imageView.layer.borderColor = UIColor.secondarySystemBackground.cgColor

        return imageView
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
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings
    
    private func setupView() {
        self.backgroundColor = UIColor(named: "SecondaryLight")
        
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 30
    }
    
    private func setupHierarchy() {
        self.addSubview(heartImageView)
    }

    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(self.snp.width)
        }
    }
    
    // MARK: - Private Functions

}
