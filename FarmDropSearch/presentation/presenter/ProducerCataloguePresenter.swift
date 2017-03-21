//
//  ProducerListPresenter.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct ProducerCataloguePresenter : Presenter {
    
    private let useCase: GetProducerCatalogueUseCase
    private let ui: ProducerCatalogueUI
    private let flowController : CanShowProducerView
    
    init(useCase: GetProducerCatalogueUseCase, ui: ProducerCatalogueUI, flowController : CanShowProducerView) {
        self.useCase = useCase
        self.ui = ui
        self.flowController = flowController
    }
    
    func viewDidLoad() {
        ui.showLoading()
        
        useCase.producerList { producerCatalogue in
            ui.loadedProducerCatalogue(producerCatalogue: producerCatalogue)
        }
    }
    
    func selected(producer : Producer) {
        flowController.showViewFor(producer: producer)
    }
    
    
    
}
