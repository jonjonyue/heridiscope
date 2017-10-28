//
//  Phenotypes.swift
//  Herediscope
//
//  Created by Jonathan yue on 10/27/17.
//  Copyright © 2017 Genesis. All rights reserved.
//

import Foundation

struct Phenotype {
    var name: String
    var description: String
    var result: Result
    var questions: [Question]
    var answered: Bool
    var type: traitType
}
