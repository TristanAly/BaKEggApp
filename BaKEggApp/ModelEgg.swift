//
//  ModelEgg.swift
//  BaKEggApp
//
//  Created by Tristan Aly on 08/08/2022.
//

import SwiftUI
import Foundation

struct Egg: Identifiable {
    var id = UUID()
    var cooking: Int
    var name: String
    var image: String
}

var eggCooking = [
Egg(cooking: 300, name: "Soft", image: "Soft"),
Egg(cooking: 480, name: "Medium", image: "Medium"),
Egg(cooking: 720, name: "Hard", image: "Hard"),
]
