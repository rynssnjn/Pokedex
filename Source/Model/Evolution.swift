//
//  Evolution.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct Evolution: Decodable {
    
    // MARK: CodingKey Enum
    public enum CodingKeys: String, CodingKey {
        case chain
        case species
        case evolvesTo = "evolves_to"
    }
    
    // MARK: Static Methods
    private static func getInnerEvolutions(from evolvesToNode: KeyedDecodingContainer<Evolution.CodingKeys>, evolutionNodes: inout [EvolutionNode]) throws -> [EvolutionNode] {
        
        let evolutionNode: EvolutionNode = try evolvesToNode.decode(EvolutionNode.self, forKey: Evolution.CodingKeys.species)
        
        evolutionNodes.append(evolutionNode)
        
        if var nextUnkeyedContainer = try? evolvesToNode.nestedUnkeyedContainer(forKey: Evolution.CodingKeys.evolvesTo) {
            
            if let keyedEvolvesNode = try? nextUnkeyedContainer.nestedContainer(keyedBy: Evolution.CodingKeys.self) {
                
                evolutionNodes = try Evolution.getInnerEvolutions(from: keyedEvolvesNode, evolutionNodes: &evolutionNodes)
                
            }
            
        }
        
        return evolutionNodes
    }
    
    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Evolution.CodingKeys> = try decoder.container(
            keyedBy: Evolution.CodingKeys.self
        )
        
        let chainNode: KeyedDecodingContainer<Evolution.CodingKeys> = try container.nestedContainer(
            keyedBy: Evolution.CodingKeys.self,
            forKey: Evolution.CodingKeys.chain
        )
        
        let rootNode: EvolutionNode = try chainNode.decode(EvolutionNode.self, forKey: Evolution.CodingKeys.species)
        
        var evolutionNodes: [EvolutionNode] = [rootNode]
        
        if var unkeyedEvolvesNode = try? chainNode.nestedUnkeyedContainer(forKey: Evolution.CodingKeys.evolvesTo) {
            
            if let keyedEvolvesNode = try? unkeyedEvolvesNode.nestedContainer(keyedBy: Evolution.CodingKeys.self) {
                
                evolutionNodes = try Evolution.getInnerEvolutions(from: keyedEvolvesNode, evolutionNodes: &evolutionNodes)
                
            }
            
        }
        
        self.nodes = evolutionNodes
    }
    
    // MARK: Stored Properties
    public let nodes: [EvolutionNode]
}
