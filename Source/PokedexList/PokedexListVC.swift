//
//  PokedexListVC.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class PokedexListVC: KioViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: PokedexListVCDelegate
    
    // MARK: Initializers
    public init(delegate: PokedexListVCDelegate, pokemons: [PokemonData]) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.dataSource = PokedexListDataSource(
            delegate: self,
            tableView: self.rootView.tableView,
            pokemons: pokemons.map(PokemonDataViewModel.init),
            searchBar: self.rootView.searchBar
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = PokedexListView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.kio.setUpNavigationItem { (navigationItem: UINavigationItem) -> Void in
            navigationItem.rightBarButtonItem = self.rootView.searchButtonItem
            self.rootView.searchButtonItem.action = #selector(PokedexListVC.searchBarButtonTapped)
            self.rootView.searchButtonItem.target = self
            
            self.rootView.cancelButtonItem.action = #selector(PokedexListVC.cancelButtonTapped)
            self.rootView.cancelButtonItem.target = self
        }
        
        self.rootView.tableView.delegate = self
    }
    
    // MARK: Stored Properties
    private var dataSource: PokedexListDataSource!
    private var _isSearching: Bool = false
}

// MARK: Views
private extension PokedexListVC {
    var rootView: PokedexListView { return self.view as! PokedexListView }
}

// MARK: Target Action Functions
private extension PokedexListVC {
    @objc func searchBarButtonTapped() {
        self.rootView.searchBar.alpha = 1.0
        self.navigationItem.titleView = self.rootView.searchBar
        self.navigationItem.setRightBarButton(self.rootView.cancelButtonItem, animated: true)
        self.rootView.searchBar.becomeFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        UIView.transition(
            with: self.rootView.searchBar,
            duration: 0.15,
            options: UIView.AnimationOptions.curveLinear,
            animations: { () -> Void in
                self.rootView.searchBar.alpha = 0.0
            },
            completion: { (isComplete: Bool) -> Void in
                switch isComplete {
                    case true:
                        self.navigationItem.titleView = nil
                        self.navigationItem.setRightBarButton(self.rootView.searchButtonItem, animated: true)
                        self.rootView.searchBar.text?.removeAll()
                        self.rootView.searchBar.resignFirstResponder()
                        self.dataSource.cancelSearch()
                    
                    case false:
                        break
                }
            }
        )
    }
}

// MARK: UITableViewDelegate Methods
extension PokedexListVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.kio.showActivityIndicator()
        self.delegate.pokemonCellTapped(self.dataSource.object(at: indexPath).model) {
            self.kio.hideActivityIndicator()
        }
    }
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction: UIContextualAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Favorite") { (action: UIContextualAction, view: UIView, completion: (Bool) -> Void) in
            print(self.dataSource.object(at: indexPath).name)
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }
}

// MARK: PokedexListDataSourceDelegate Methods
extension PokedexListVC: PokedexListDataSourceDelegate {
    public var isSearching: Bool {
        get { return self._isSearching }
        
        set { self._isSearching = newValue }
    }
}
