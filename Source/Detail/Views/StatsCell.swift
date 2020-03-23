//
//  StatsCell.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import UIKit
import SnapKit
import Kio

public final class StatsCell: UICollectionViewCell {
    
    // MARK: Subviews
    private let hpTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = hp.uppercased()
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    public let hpValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    private let atkTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = attack.capitalized
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    public let atkValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    private let defTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = defense.capitalized
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    public let defValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    private let spAtkTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = spAttack
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    public let spAtkValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    private let spDefTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = spDefense
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    public let spDefValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    private let spdTitleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = speed.capitalized
        view.textAlignment = NSTextAlignment.left
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    public let spdValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textAlignment = NSTextAlignment.center
        view.font = UIFont.systemFont(ofSize: 15.0)
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [
            self.hpTitleLabel,
            self.atkTitleLabel,
            self.defTitleLabel,
            self.spAtkTitleLabel,
            self.spDefTitleLabel,
            self.spdTitleLabel
            ])
        
        view.distribution = UIStackView.Distribution.fillEqually
        view.alignment = UIStackView.Alignment.fill
        view.axis = NSLayoutConstraint.Axis.vertical
        return view
    }()
    
    private let hpStatView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.hp
        return view
    }()
    
    private let atkStatView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.atk
        return view
    }()
    
    private let defStatView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.def
        return view
    }()
    
    private let spAtkStatView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.spAtk
        return view
    }()
    
    private let spDefStatView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.spDef
        return view
    }()
    
    private let spdStatView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.spd
        return view
    }()
    
    private var maxWidthValue: CGFloat {
        return self.bounds.width - 100.0 - 10.0 - 5.0 - 10.0
    }
    
    private var valuePerStatPoint: CGFloat {
        return self.maxWidthValue / 200.0
    }
    
    private var statViews: [UIView] {
        return [
            self.hpStatView, self.atkStatView,
            self.defStatView, self.spAtkStatView,
            self.spDefStatView, self.spdStatView
        ]
    }
    
    private var titleLabels: [UILabel] {
        return [
            self.hpTitleLabel, self.atkTitleLabel,
            self.defTitleLabel, self.spAtkTitleLabel,
            self.spDefTitleLabel, self.spdTitleLabel
        ]
    }
    
    private var valueLabels: [UILabel] {
        return [
            self.hpValueLabel, self.atkValueLabel,
            self.defValueLabel, self.spAtkValueLabel,
            self.spDefValueLabel, self.spdValueLabel
        ]
    }
    
    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.white
        
        self.kio.subviews(forAutoLayout:
            self.titleStackView,
                          self.hpStatView, self.atkStatView,
                          self.defStatView, self.spAtkStatView,
                          self.spDefStatView, self.spdStatView,
                          self.hpValueLabel, self.atkValueLabel,
                          self.defValueLabel, self.spAtkValueLabel,
                          self.spDefValueLabel, self.spdValueLabel
        )
        
        self.titleStackView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.width.equalTo(100.0)
            make.height.equalTo(200.0)
        }
        
        for (statView, titleLabel) in zip(self.statViews, self.titleLabels) {
            statView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
                make.leading.equalTo(self.titleStackView.snp.trailing).offset(5.0)
                make.centerY.equalTo(titleLabel)
                make.width.equalTo(0.0)
                make.height.equalTo(titleLabel).inset(5.0)
            }
        }
        
        for (statView, valueLabel) in zip(self.statViews, self.valueLabels) {
            valueLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
                make.leading.equalTo(statView.snp.trailing).offset(5.0)
                make.height.equalTo(statView)
                make.centerY.equalTo(statView)
            }
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Configurable Properites & Methods
extension StatsCell: Configurable {
    
    public static var identifier: String = "StatsCell"
    
    public func configure(with viewModel: StatsViewModel) {
        
        self.hpValueLabel.text = viewModel.hp
        self.atkValueLabel.text = viewModel.atk
        self.defValueLabel.text = viewModel.def
        self.spAtkValueLabel.text = viewModel.spAtk
        self.spDefValueLabel.text = viewModel.spDef
        self.spdValueLabel.text = viewModel.spd
        
        for (statView, statValue) in zip(self.statViews, viewModel.statValues) {
            statView.snp.updateConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                make.width.equalTo(statValue * self.valuePerStatPoint)
            }
        }
        
        self.layoutIfNeeded()
    }
    
}

