//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import SnapKit

public final class PokemonCell: UITableViewCell {
    
    // MARK: Subviews
    public let pokemonImageView: UIImageView = {
        let view: UIImageView = UIImageView(image: #imageLiteral(resourceName: "placeholderRect"))
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    public let nameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16.0)
        view.adjustsFontSizeToFitWidth = false
        view.numberOfLines = 1
        view.textAlignment = NSTextAlignment.center
        return view
    }()
    
    public let heightValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 12.0)
        view.adjustsFontSizeToFitWidth = false
        view.numberOfLines = 1
        view.textAlignment = NSTextAlignment.center
        return view
    }()
    
    public let weightValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 12.0)
        view.adjustsFontSizeToFitWidth = false
        view.numberOfLines = 1
        view.textAlignment = NSTextAlignment.center
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [self.nameLabel, self.heightValueLabel, self.weightValueLabel])
        view.axis = NSLayoutConstraint.Axis.vertical
        view.distribution = UIStackView.Distribution.fillEqually
        view.alignment = UIStackView.Alignment.fill
        view.spacing = 5.0
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.white
        self.rsj.addViews(forAutoLayout: self.pokemonImageView, self.stackView)
        self.rsj.cornerRadius(of: 5.0)
        
        self.pokemonImageView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(20.0)
            make.centerY.equalToSuperview()
            make.width.equalTo(75.0)
            make.height.equalTo(75.0)
        }
        
        self.stackView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().inset(15.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Identifier
extension PokemonCell {
    public static var identifier: String = "PokemonCell"
}

// MARK: Configurable Cell
extension PokemonCell {
    public func configure(with viewModel: PokemonDataViewModel) {
        self.nameLabel.text = viewModel.name
        self.heightValueLabel.text = "\(height.uppercased()): \(viewModel.height)"
        self.weightValueLabel.text = "\(weight.uppercased()): \(viewModel.weight)"
        self.pokemonImageView.image = viewModel.image
    }
}
