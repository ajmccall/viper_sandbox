//
//  MockProducerDataStore.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct MockProducerDataStore {
    
    let path = Bundle.main.url(forResource: "producers-page1", withExtension: "json")
    let rawProducers : [ProducerDTO]
    
    init() {

        var arrayOfProducers = [ProducerDTO]()
        do {
            let data = try Data(contentsOf: path!)
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = json as? [String: Any] {

                if let jsonListOfProducers = jsonResponse["response"] as? [Any] {
                    
                    // should use a map here maybe?
                    for object in jsonListOfProducers {
                        
                        if let jsonProducer = object as? [String: Any] {
                            
                            if let producer = ProducerDTO(json: jsonProducer) {
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

    func producerCatalogue(completion: ([ProducerDTO]) -> Void) {
        completion(rawProducers)
    }

    func getProducer(byId id: Int, completion: (ProducerDTO?) -> Void) {
        
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

extension ProducerDTO {
    
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
        self.imageSets = []

        for object in images {
            if let imageSetJson = object as? [String: Any] {
                if let imageSet = ImageSetDTO(json: imageSetJson) {
                    self.imageSets.append(imageSet)
                }
            }
        }
        
    }
}

/*
 "images":[{"path":"https://fd-v5-api-release.imgix.net/assets/producer/840a557f38a55e0dd8ee6bd8cd08b1be7adafa4c26037c1a5f62f1b38a0e7a7e/DSC05545.JPG","position":1}]
 */

extension ImageSetDTO {
    
    init?(json: [String: Any]) {
        
        guard
            let path = json["path"] as? String,
            let position = json["position"] as? Int
        else {
                return nil
        }
        
        self.path = path
        self.position = position
    }
}
