//
//  AllProducersUI.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

protocol ProducerCatalogueUI {
    var presenter: ProducerCataloguePresenter! {get set}
    
    func showLoading()
    
    func loadedProducerCatalogue(producerCatalogue: ProducerCatalogue)
}
