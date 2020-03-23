//
//  PokedexListService.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation
import Astral
import BrightFutures
import BFAstral

public struct PokedexListService {
    
    private let decoder: JSONDecoder = JSONDecoder()
    
    private func getPokemonData(with data: PokemonData) -> Future<Pokemon, NetworkingError> {
        let request: Request = PokemonRequest(pokemonData: data)
        
        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> Pokemon in
                do {
                    
                    return try self.decoder.decode(Pokemon.self, from: response.data)
                    
                } catch let error {
                    
                    fatalError(error.localizedDescription)
                    
                }
        }
    }
    
    private func getSpeciesData(with data: PokemonData) -> Future<Species, NetworkingError> {
        
        let request: Request = SpeciesRequest(pokemonData: data)
        
        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> Species in
                do {
                    
                    return try self.decoder.decode(Species.self, from: response.data)
                    
                } catch let error {
                    
                    fatalError(error.localizedDescription)
                    
                }
        }
    }
    
    private func getEvolutionData(with species: Species) -> Future<Evolution, NetworkingError> {
        
        let request: Request = EvolutionRequest(url: species.evolutionURL)
        
        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> Evolution in
                do {
                    
                    return try self.decoder.decode(Evolution.self, from: response.data)
                    
                } catch let error {
                    
                    fatalError(error.localizedDescription)
                    
                }
        }
    }
    
    public func getDetailData(with icon: PokemonData) -> Future<DetailModels, NetworkingError> {
        return self.getPokemonData(with: icon)
            .zip(self.getSpeciesData(with: icon))
            .flatMap(NetworkQueue.context) { (pokemon: Pokemon, species: Species) -> Future<DetailModels, NetworkingError> in
                
                return self.getEvolutionData(with: species)
                    .map(NetworkQueue.context) { (evolution: Evolution) -> DetailModels in
                        
                        return DetailModels(
                            pokemon: pokemon,
                            species: species,
                            evolution: evolution
                        )
                }
        }
    }
    
}
