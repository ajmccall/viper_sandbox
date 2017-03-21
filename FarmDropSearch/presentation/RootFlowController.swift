//
//  RootFlowController.swift
//  FarmDropSearch
//
//  Created by alasdair on 20/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation
import UIKit

protocol CanShowProducerView {
    func showViewFor(producer : Producer)
}

class RootFlowController : CanShowProducerView {
    
    private lazy var producerDataSource = ProducerRepository()
    
    lazy var rootViewController: UINavigationController = UINavigationController.init(rootViewController: self.producerCatalogueUI)
    
    private lazy var producerCatalogueUI : ProducerCatalogueViewController = {
        
        let ui = ProducerCatalogueViewController(nibName:String(describing: ProducerCatalogueViewController.self), bundle:nil)

        let useCase = GetProducerCatalogueUseCase(producerDataSource: self.producerDataSource)
        let presenter = ProducerCataloguePresenter(useCase: useCase, ui: ui, flowController: self)
        
        ui.presenter = presenter
        return ui
    }()
    
    func showViewFor(producer : Producer) {
        
        let producerViewController : ProducerViewController = {
            
            let ui = ProducerViewController(nibName:String(describing: ProducerViewController.self), bundle:nil)
            
            let presenter = ProducerPresenter(producer: producer, ui: ui)
            
            ui.presenter = presenter
            return ui
        }()
        
        rootViewController.pushViewController(producerViewController, animated: true)
    }
    
}
