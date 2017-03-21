//
//  ProducerUI.swift
//  FarmDropSearch
//
//  Created by alasdair on 21/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

protocol ProducerUI {
    
    var presenter : ProducerPresenter! { get set }
    
    func isLoading()
    func showErrorLoading()
    
    func loadedProducer(producer : Producer)
    
}
