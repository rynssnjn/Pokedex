//
//  PokedexListDataSource.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class PokedexListDataSource: KioObject {
    
    // MARK: Delegate Properties
    private unowned let delegate: PokedexListDataSourceDelegate
    
    // MARK: Initializer
    public init(delegate: PokedexListDataSourceDelegate, tableView: UITableView, pokemons: [PokemonDataViewModel], searchBar: UISearchBar) {
        self.delegate = delegate
        self.tableView = tableView
        self.pokemons = pokemons
        self.filteredPokemons = pokemons
        super.init()
        searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.identifier)
    }
    
    // MARK: Stored Properties
    private let tableView: UITableView
    private let pokemons: [PokemonDataViewModel]
    private var filteredPokemons: [PokemonDataViewModel]
    
    // MARK: Instance Methods
    public func object(at indexPath: IndexPath) -> PokemonDataViewModel {
        return self.filteredPokemons[indexPath.item]
    }
    
    public func cancelSearch() {
        self.filteredPokemons = self.pokemons
        self.tableView.reloadData()
    }
}

// MARK: UITableView Data Source
extension PokedexListDataSource: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemons.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PokemonCell.identifier
        ) as? PokemonCell else { return UITableViewCell() }

        cell.configure(with: self.filteredPokemons[indexPath.item])

        return cell
    }
}

// MARK: UISearchBar Delegate Methods
extension PokedexListDataSource: UISearchBarDelegate {
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.delegate.isSearching = true
        return true
    }
    
    public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.delegate.isSearching = false
        return false
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        switch searchText.isEmpty {
            case true:
                DispatchQueue.main.async {
                    self.cancelSearch()
                }
            case false:
                let filteredPokemons: [PokemonDataViewModel] = self.pokemons.filter {
                    $0.name.lowercased().contains(searchText.lowercased())
                }
                
                self.filteredPokemons = filteredPokemons
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
    }
}
