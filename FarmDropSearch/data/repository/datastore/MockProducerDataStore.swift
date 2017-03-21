//
//  MockProducerDataStore.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct MockProducerDataStore : ProducerDataSource {
    
    let path = Bundle.main.url(forResource: "producers-page1", withExtension: "json")
    let rawProducers : [Producer]
    
    init() {

        var arrayOfProducers = [Producer]()
        do {
            let data = try Data(contentsOf: path!)
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = json as? [String: Any] {

                if let jsonListOfProducers = jsonResponse["response"] as? [Any] {
                    
                    // should use a map here maybe?
                    for object in jsonListOfProducers {
                        
                        if let jsonProducer = object as? [String: Any] {
                            
                            if let producer = Producer(json: jsonProducer) {
                                arrayOfProducers.append(producer)
                            }
                        }
                    }
                }
            }
        } catch  {
        }
        
        rawProducers = arrayOfProducers
    }

    func producerCatalogue(completion: (ProducerCatalogue) -> Void) {
        completion(ProducerCatalogue(producers: rawProducers, page: 0))
    }

    func getProducer(byId id: Int, completion: (Producer?) -> Void) {
        
        var found = false
        for producer in rawProducers {
            if (producer.id == id) {
                completion(producer)
                found = true
                break
            }
        }
        
        if (!found) {
            completion(nil)
        }
    }
}

extension Producer {
    
    init?(json: [String: Any]) {
     
        guard
            let name = json["name"] as? String,
            let location = json["location"] as? String,
            let shortDescription = json["short_description"] as? String,
            let id = json["id"]  as? Int,
            let images = json["images"] as? [Any]
        else {
            return nil
        }
        
        self.name = name
        self.id = id
        self.location = location
        self.shortDescription = shortDescription
        
        var urls = [URL]()
        for object in images {
            if let imageDictionary = object as? [String: Any] {
                if let path = imageDictionary["path"] as? String {
                    if let url = URL(string: path) {
                        urls.append(url)
                    }
                }
            }
        }
        self.imageURLs = urls
        
    }
}
