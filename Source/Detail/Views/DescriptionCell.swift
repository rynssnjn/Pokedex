//
//  DescriptionCell.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit
import SnapKit
import Kio

public final class DescriptionCell: UICollectionViewCell {
    
    // MARK: Subviews
    public let imageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    public let descriptionTextView: UITextView = {
        let view: UITextView = UITextView()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.backgroundColor = Colors.white
        return view
    }()
    
    private let heightTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "\(height.capitalized):"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    public let heightValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    private let weightTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "\(weight.capitalized):"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    public let weightValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    private let typeTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "\(type.capitalized):"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    public let typeValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    private let idTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "\(idText.uppercased()):"
        view.font = UIFont.boldSystemFont(ofSize: 13.0)
        return view
    }()
    
    public let idValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 13.0)
        return view
    }()
    
    private let evolutionOverlay: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    public let evolutionLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "\(evolution.uppercased())(S)"
        view.textColor = Colors.white
        view.font = UIFont.boldSystemFont(ofSize: 15.0)
        return view
    }()
    
    public let containerView: UIView = UIView()
    
    private let stackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.distribution = UIStackView.Distribution.fillEqually
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.alignment = UIStackView.Alignment.fill
        view.spacing = 2.0
        return view
    }()
    
    // MARK: Computed Properties
    private var labelHeight: CGFloat {
        return 25.0
    }
    
    private var labelValueOffset: CGFloat {
        return 5.0
    }
    
    private var interLabelOffset: CGFloat {
        return 5.0
    }
    
    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.white
        self.kio.subviews(forAutoLayout:
            self.imageView, self.descriptionTextView,
            self.heightTitleLabel, self.heightValueLabel,
            self.weightTitleLabel, self.weightValueLabel,
            self.typeTitleLabel, self.typeValueLabel,
            self.idTitleLabel, self.idValueLabel,
            self.evolutionOverlay, self.containerView
        )
        
        self.containerView.kio.subview(forAutoLayout: self.stackView)
        
        self.evolutionOverlay.kio.subview(forAutoLayout: self.evolutionLabel)
        
        self.imageView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.width.equalTo(100.0)
            make.height.equalTo(100.0)
        }
        
        self.descriptionTextView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(10.0)
            make.leading.equalTo(self.imageView.snp.trailing).offset(5.0)
            make.trailing.equalToSuperview().inset(10.0)
            make.height.equalTo(150.0)
        }
        
        self.heightTitleLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.descriptionTextView.snp.bottom).offset(10.0)
            make.leading.equalToSuperview().offset(20.0)
            make.height.equalTo(self.labelHeight)
            make.width.equalTo(50.0)
        }
        
        self.heightValueLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.heightTitleLabel)
            make.leading.equalTo(self.heightTitleLabel.snp.trailing).offset(self.labelValueOffset)
            make.height.equalTo(self.heightTitleLabel)
        }
        
        self.weightTitleLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.heightTitleLabel.snp.bottom).offset(self.interLabelOffset)
            make.leading.equalToSuperview().offset(20.0)
            make.width.equalTo(self.heightTitleLabel)
            make.height.equalTo(self.heightTitleLabel)
        }
        
        self.weightValueLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.weightTitleLabel)
            make.leading.equalTo(self.weightTitleLabel.snp.trailing).offset(self.labelValueOffset)
            make.height.equalTo(self.weightTitleLabel)
        }
        
        self.idTitleLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.descriptionTextView.snp.bottom).offset(10.0)
            make.leading.equalTo(self.snp.centerX).offset(20.0)
            make.height.equalTo(self.heightTitleLabel)
        }
        
        self.idValueLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.idTitleLabel)
            make.leading.equalTo(self.idTitleLabel.snp.trailing).offset(self.labelValueOffset)
            make.centerY.equalTo(self.idTitleLabel)
            make.height.equalTo(self.heightTitleLabel)
        }
        
        self.typeTitleLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.idTitleLabel.snp.bottom).offset(self.labelValueOffset)
            make.leading.equalTo(self.snp.centerX).offset(20.0)
            make.height.equalTo(self.heightTitleLabel)
        }
        
        self.typeValueLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.typeTitleLabel)
            make.leading.equalTo(self.typeTitleLabel.snp.trailing).offset(self.labelValueOffset)
            make.centerY.equalTo(self.typeTitleLabel)
            make.height.equalTo(self.heightTitleLabel)
        }
        
        self.evolutionOverlay.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.typeTitleLabel.snp.bottom).offset(10.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40.0)
        }
        
        self.evolutionLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(5.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(5.0)
        }
        
        self.containerView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.evolutionOverlay.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.stackView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.width.equalTo(300.0)
            make.height.equalTo(100.0)
            make.center.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Instance Methods
    public func configureStackView(with images: [UIImage?]) {
        
        self.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for image in images {
            let imageView: UIImageView = {
                let view: UIImageView = UIImageView(image: image)
                view.contentMode = UIView.ContentMode.scaleAspectFit
                view.clipsToBounds = true
                return view
            }()
            
            self.stackView.addArrangedSubview(imageView)
        }
        
    }
}

// MARK: Configurable Properites & Methods
extension DescriptionCell: Configurable {
    
    public static var identifier: String = "DescriptionCell"
    
    public func configure(with viewModel: DescriptionViewModel) {
        self.imageView.image = viewModel.image
        
        self.heightValueLabel.text = viewModel.height
        self.weightValueLabel.text = viewModel.weight
        self.idValueLabel.text = viewModel.id
        self.typeValueLabel.text = viewModel.types
        self.descriptionTextView.text = viewModel.text
        self.configureStackView(with: viewModel.evolutionImages)
        
        let color: UIColor = viewModel.color
        
        self.evolutionOverlay.backgroundColor = color
        self.heightTitleLabel.textColor = color
        self.weightTitleLabel.textColor = color
        self.idTitleLabel.textColor = color
        self.typeTitleLabel.textColor = color
        
    }
}

