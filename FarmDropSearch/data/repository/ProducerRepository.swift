//
//  ProducerDataRepository.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct ProducerRepository : ProducerDataSource {
    

    
    // In a real world, there would be a mapping between the domain "Product" entity and the data ProducerDTO entity
    //
    // The producerDataStore would provider this mappging, but we are just return domain "Product" entity objects.

    let producerDataStore = MockProducerDataStore()
    
    func producerCatalogue(completion: (ProducerCatalogue) -> Void) {
        
        producerDataStore.producerCatalogue(completion: completion)
    }
    
    func getProducer(byId id: Int, completion: (Producer?) -> Void) {

        producerDataStore.getProducer(byId: id, completion: completion)
    }
    
}
