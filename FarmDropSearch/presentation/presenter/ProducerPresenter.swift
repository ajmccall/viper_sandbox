//
//  ProducerPresenter.swift
//  FarmDropSearch
//
//  Created by alasdair on 21/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct ProducerPresenter : Presenter {
    
    private let producer : Producer
    private let ui : ProducerUI
    
    init(producer : Producer, ui : ProducerUI) {
        self.producer = producer
        self.ui = ui
    }
    
    func viewDidLoad() {
        
        ui.loadedProducer(producer: producer)
    }
}
