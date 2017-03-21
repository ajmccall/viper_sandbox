//
//  ProducerViewController.swift
//  FarmDropSearch
//
//  Created by alasdair on 21/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import UIKit

class ProducerViewController: UIViewController, ProducerUI {

    var presenter: ProducerPresenter!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shortDescription: UITextView!
    @IBOutlet weak var produceImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    func isLoading() {
    }
    
    func showErrorLoading() {
    }
    
    func loadedProducer(producer: Producer) {
        
        title = producer.name
        shortDescription.text = producer.shortDescription
        locationLabel.text = producer.location
        
        if producer.imageURLs.count > 0 {
            
            do {
                try produceImage.image = UIImage(data: Data(contentsOf: producer.imageURLs[0]))
            } catch  {
            }
        }
    }
}
