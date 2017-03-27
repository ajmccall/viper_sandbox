//
//  ProducerDataRepository.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct ProducerRepository : ProducerDataSource {
    
    let producerDataStore = MockProducerDataStore()
    
    func producerCatalogue(completion: (ProducerCatalogue) -> Void) {
        
        producerDataStore.producerCatalogue { (producerDTOs) in
            
            completion(ProducerDTOEntityMapper.mapToProducerCatalogue(from: producerDTOs))
        }
    }
    
    func getProducer(byId id: Int, completion: (Producer?) -> Void) {
        
        producerDataStore.getProducer(byId: id) { (retValue) in
            
            if let producerDTO = retValue {
                completion(ProducerDTOEntityMapper.mapToProducer(from: producerDTO))
            } else {
                completion(nil)
            }
        }
    }
    
}
