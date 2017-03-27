//
//  ProducerDTOEntityMapper.swift
//  FarmDropSearch
//
//  Created by alasdair on 27/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

class ProducerDTOEntityMapper {
    
    
    class func mapToProducer(from dto: ProducerDTO) -> Producer {
        return Producer(id: dto.id,
                        name: dto.name,
                        shortDescription: dto.shortDescription,
                        location: dto.location,
                        imageURLs: dto.imageSets.map( { URL(string: $0.path)! } ))
    }
    
    class func mapToProducerCatalogue(from dtos: [ProducerDTO]) -> ProducerCatalogue {
        let producers = dtos.map{ mapToProducer(from: $0) }
        return ProducerCatalogue(producers: producers, page: 0)
    }
}
