//
//  AutosomalDominant.swift
//  Herediscope
//
//  Created by Jonathan yue on 10/28/17.
//  Copyright © 2017 Genesis. All rights reserved.
//

import Foundation

class AutosomalDominant {
    var parent1: Genotype
    var parent2: Genotype
    
    init() {
        parent1 = Genotype.NotSet
        parent2 = Genotype.NotSet
    }
    
    init(parentOne: Genotype, parentTwo: Genotype) {
        self.parent1 = parentOne
        self.parent2 = parentTwo
    }
    
    func percentage() -> Double {
        var ans: Double = 0.0;
        if (parent1 == Genotype.Expressed) {
            if(parent2 == Genotype.Expressed) {
                ans = 87.5;
            } else {
                ans = 75.0;
            }
        } else if (parent2 == Genotype.Expressed) {
            ans = 75.0;
        }
        return ans;
    }
}
