//
//  ProducerDataSource.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

/**
 * Protocol that represents a Repository for getting Producer related data.
 */
import Foundation

protocol ProducerDataSource {
    
    func producerCatalogue(completion: (ProducerCatalogue) -> Void)
    func getProducer(byId : Int, completion: (Producer?) -> Void)
}
