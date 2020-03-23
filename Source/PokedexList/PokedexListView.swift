//
//  PokedexListView.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import SnapKit

public final class PokedexListView: KioView {

    // MARK: Subviews
    public let searchBar: UISearchBar = {
        let view: UISearchBar = UISearchBar()
        view.placeholder = searchPlaceholder
        return view
    }()
    
    public let searchButtonItem: UIBarButtonItem = {
        let item: UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.search,
            target: nil,
            action: nil
        )
        item.tintColor = UIColor.white
        return item
    }()
    
    public let cancelButtonItem: UIBarButtonItem = {
        let item: UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.cancel,
            target: nil,
            action: nil
        )
        item.tintColor = UIColor.white
        return item
    }()
    
    public let tableView: UITableView = {
        let view: UITableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        view.separatorColor = Colors.red
        return view
    }()
    
    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.white
        self.kio.subviews(forAutoLayout: self.tableView)
        
        self.tableView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(20.0)
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().inset(10.0)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
