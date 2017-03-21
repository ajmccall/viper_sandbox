//
//  Producer.swift
//  FarmDropSearch
//
//  Created by alasdair on 19/03/2017.
//  Copyright © 2017 alasdair. All rights reserved.
//

/*
 A struct the represents the Producer at the domain layer
 */

import Foundation

struct Producer {
    let id: Int
    let name: String
    let shortDescription: String
    let location: String
    let imageURLs : [URL]
}
