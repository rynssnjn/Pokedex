//
//  DetailView.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import SnapKit

public final class DetailView: RSJView {
    
    // MARK: Subviews
    public let segmentedControl: UISegmentedControl = {
        let view: UISegmentedControl = UISegmentedControl(
            items: [desc.uppercased(), stats.uppercased()]
        )
        
        view.selectedSegmentIndex = 0
        return view
    }()
    
    public let titleLabel: UILabel = {
        let view: UILabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 128.0, height: 25.0))
        view.textColor = Colors.white
        view.font = UIFont.systemFont(ofSize: 17.0)
        view.textAlignment = NSTextAlignment.center
        return view
    }()
    
    public let backButtonItem: UIBarButtonItem = {
        let item: UIBarButtonItem = UIBarButtonItem(
            title: back.capitalized,
            style: UIBarButtonItem.Style.plain,
            target: nil,
            action: nil
        )
        item.tintColor = Colors.white
        return item
    }()
    
    public let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 0.0
        let view: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = Colors.white
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.white
        
        self.rsj.addViews(forAutoLayout: self.segmentedControl, self.collectionView)
        
        self.segmentedControl.snp.remakeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(10.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
            make.height.equalTo(30.0)
        }
        
        self.collectionView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.segmentedControl.snp.bottom).offset(15.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
