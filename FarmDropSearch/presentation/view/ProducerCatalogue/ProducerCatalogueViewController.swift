//
//  ViewController.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import UIKit

class ProducerCatalogueViewController: UIViewController, ProducerCatalogueUI, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    private var producerCatalogue = ProducerCatalogue()
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchController: UISearchController!
    
    
    var presenter: ProducerCataloguePresenter! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchController()
        presenter.viewDidLoad()
    }
    
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a producer..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        <#code#>
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
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

