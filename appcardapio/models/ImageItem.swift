// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let temperatures = try? JSONDecoder().decode(Temperatures.self, from: jsonData)

import Foundation

// MARK: - Temperatures
class ImageItem: Codable {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images

    init(id: Int, name: String, slug: String, powerstats: Powerstats, appearance: Appearance, biography: Biography, work: Work, connections: Connections, images: Images) {
        self.id = id
        self.name = name
        self.slug = slug
        self.powerstats = powerstats
        self.appearance = appearance
        self.biography = biography
        self.work = work
        self.connections = connections
        self.images = images
    }
}

// MARK: - Appearance
class Appearance: Codable {

    let height, weight: [String]
    let eyeColor, hairColor: String

    init( height: [String], weight: [String], eyeColor: String, hairColor: String) {

       
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}

// MARK: - Biography
class Biography: Codable {
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance, alignment: String

    init(fullName: String, alterEgos: String, aliases: [String], placeOfBirth: String, firstAppearance: String, alignment: String) {
        self.fullName = fullName
        self.alterEgos = alterEgos
        self.aliases = aliases
        self.placeOfBirth = placeOfBirth
        self.firstAppearance = firstAppearance
        self.alignment = alignment
    }
}

// MARK: - Connections
class Connections: Codable {
    let groupAffiliation, relatives: String

    init(groupAffiliation: String, relatives: String) {
        self.groupAffiliation = groupAffiliation
        self.relatives = relatives
    }
}

// MARK: - Images
class Images: Codable {
    let xs, sm, md, lg: String

    init(xs: String, sm: String, md: String, lg: String) {
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
    }
}

// MARK: - Powerstats
class Powerstats: Codable {
    let intelligence, strength, speed, durability: Int
    let power, combat: Int

    init(intelligence: Int, strength: Int, speed: Int, durability: Int, power: Int, combat: Int) {
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
    }
}

// MARK: - Work
class Work: Codable {
    let occupation, base: String

    init(occupation: String, base: String) {
        self.occupation = occupation
        self.base = base
    }
}
