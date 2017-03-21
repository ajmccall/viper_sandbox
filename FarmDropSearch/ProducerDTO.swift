//
//  ProducerDTO.swift
//  FarmDropSearch
//
//  Created by alasdair on 21/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

import Foundation

struct ProducerDTO {
    let id: Int
    let name: String
    let shortDescription: String
    let location: String
    let imageSets : [ImageSetDTO]
}

struct ImageSetDTO {
    let path: String
    let index: Int
}
