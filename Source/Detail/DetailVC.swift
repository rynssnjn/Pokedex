//
//  DetailVC.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class DetailVC: KioViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: DetailVCDelegate
    
    // MARK: Initializers
    public init(delegate: DetailVCDelegate, descriptionViewModel: DescriptionViewModel, statsViewModel: StatsViewModel) {
        self.delegate = delegate
        self.descriptionViewModel = descriptionViewModel
        self.statsViewModel = statsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = DetailView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.collectionView.register(
            DescriptionCell.self,
            forCellWithReuseIdentifier: DescriptionCell.identifier
        )

        self.rootView.collectionView.register(
            StatsCell.self,
            forCellWithReuseIdentifier: StatsCell.identifier
        )

        self.rootView.collectionView.delegate = self
        self.rootView.collectionView.dataSource = self
        
        self.kio.setUpNavigationItem { [weak self] (navigationItem: UINavigationItem) in
            guard let s = self else { return }
            
            s.rootView.titleLabel.text = s.descriptionViewModel.name.uppercased()
            navigationItem.titleView = s.rootView.titleLabel
            s.navigationItem.leftBarButtonItem = s.rootView.backButtonItem
            s.rootView.backButtonItem.target = s
            s.rootView.backButtonItem.action = #selector(DetailVC.backButtonItemTapped)
        }

        self.kio.setUpTargetActions(with: [
            self.rootView.segmentedControl: #selector(DetailVC.segmentedControlTapped(_:))
        ])
        
        self.setupSegmentedControl()
    }
    
    // MARK: Stored Properties
    private let descriptionViewModel: DescriptionViewModel
    private let statsViewModel: StatsViewModel
    
    // MARK: Instance Methods
    private func setupSegmentedControl() {
        self.rootView.segmentedControl.tintColor = descriptionViewModel.color
    }
}

// MARK: Views
private extension DetailVC {
    unowned var rootView: DetailView { return self.view as! DetailView }
}

// MARK: Target Action Functions
private extension DetailVC {
    @objc func backButtonItemTapped() {
        self.delegate.backButtonItemTapped()
    }
    
    @objc func segmentedControlTapped(_ control: UISegmentedControl) {
        let itemIndex: Int = control.selectedSegmentIndex
        
        let indexPath: IndexPath = IndexPath(item: itemIndex, section: 0)
        
        self.rootView.collectionView.scrollToItem(
            at: indexPath,
            at: UICollectionView.ScrollPosition.centeredHorizontally,
            animated: true
        )
    }
}

// MARK: UICollectionViewDataSource Methods
extension DetailVC: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cellView: SegmentedControl = SegmentedControl(rawValue: indexPath.item)
        else {
            return UICollectionViewCell()
        }
        
        switch cellView {
            case .description:
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: DescriptionCell.identifier,
                        for: indexPath
                    ) as? DescriptionCell
                else {
                    return UICollectionViewCell()
                }
                
                cell.configure(with: self.descriptionViewModel)
                return cell
            case .stats:
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: StatsCell.identifier,
                        for: indexPath
                    ) as? StatsCell
                else {
                    return UICollectionViewCell()
                }
                
                cell.configure(with: self.statsViewModel)
                return cell
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout Methods
extension DetailVC: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: self.rootView.collectionView.frame.width,
            height: self.rootView.collectionView.frame.height
        )
    }
}

// MARK: ScrollView Delegate Methods
extension DetailVC {
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index: Int = Int(targetContentOffset.pointee.x / self.view.bounds.width)
        
        self.rootView.segmentedControl.selectedSegmentIndex = index
    }
}
