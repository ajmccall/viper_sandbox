//
//  GetProducerDetails.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct GetProducerDetails : UseCase {
    
    let producerDataSource: ProducerDataSource

    func getProducer(byId : Int, completion: (Producer?) -> Void) {
        producerDataSource.getProducer(byId: byId, completion: completion)
    }
}
