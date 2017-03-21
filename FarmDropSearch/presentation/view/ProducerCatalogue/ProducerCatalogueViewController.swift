//
//  ViewController.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import UIKit

class ProducerCatalogueViewController: UIViewController, ProducerCatalogueUI, UITableViewDataSource, UITableViewDelegate {

    private var producerCatalogue = ProducerCatalogue()
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ProducerCataloguePresenter! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    func showLoading() {
        // put up spinner
    }
    
    func loadedProducerCatalogue(producerCatalogue: ProducerCatalogue) {
        
        self.producerCatalogue = producerCatalogue
        tableView.reloadData()
    }
    
    // MARK - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Identifier")
        
        let producer = producerCatalogue.producers[indexPath.row]
        cell.textLabel?.text = producer.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producerCatalogue.producers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.selected(producer: producerCatalogue.producers[indexPath.row])
    }
    

}

