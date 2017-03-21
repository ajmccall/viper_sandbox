//
//  GetProducerCatalogueUseCase.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import UIKit

struct GetProducerCatalogueUseCase: UseCase {

    let producerDataSource: ProducerDataSource

    func producerList(completion: (ProducerCatalogue) -> Void) {
        producerDataSource.producerCatalogue(completion: completion)
    }
}
