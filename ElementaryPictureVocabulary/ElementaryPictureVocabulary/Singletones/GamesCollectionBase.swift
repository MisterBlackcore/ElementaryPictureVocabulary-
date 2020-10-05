//
//  GamesCollectionBase.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/3/20.
//

import Foundation
import UIKit

class GamesCollectionBase {
    
    var sectionsArray:[[Word]] = []
    
    let verbsArray = [Word(name: "Blow", image: UIImage(named: "Blow")!),
                      Word(name: "Brush", image: UIImage(named: "Brush")!),
                      Word(name: "Build", image: UIImage(named: "Build")!),
                      Word(name: "Buy", image: UIImage(named: "Buy")!),
                      Word(name: "Carry", image: UIImage(named: "Carry")!),
                      Word(name: "Catch", image: UIImage(named: "Catch")!),
                      Word(name: "Cook", image: UIImage(named: "Cook")!),
                      Word(name: "Cry", image: UIImage(named: "Cry")!),
                      Word(name: "Cut", image: UIImage(named: "Cut")!),
                      Word(name: "Do", image: UIImage(named: "Do")!),
                      Word(name: "Draw", image: UIImage(named: "Draw")!),
                      Word(name: "Drive", image: UIImage(named: "Drive")!),
                      Word(name: "Fly", image: UIImage(named: "Fly")!),
                      Word(name: "Give", image: UIImage(named: "Give")!),
                      Word(name: "Go", image: UIImage(named: "Go")!),
                      Word(name: "Hang", image: UIImage(named: "Hang")!),
                      Word(name: "Sit", image: UIImage(named: "Sit")!),
                      Word(name: "Sleep", image: UIImage(named: "Sleep")!),
                      Word(name: "Speak", image: UIImage(named: "Speak")!),
                      Word(name: "Stand", image: UIImage(named: "Stand")!),
                      Word(name: "Sweep", image: UIImage(named: "Sweep")!),
                      Word(name: "Swim", image: UIImage(named: "Swim")!),
                      Word(name: "Take", image: UIImage(named: "Take")!),
                      Word(name: "Write", image: UIImage(named: "Write")!)]
    
    let numbersArray = [Word(name: "one", image: UIImage(named: "1")!),
                        Word(name: "two", image: UIImage(named: "2")!),
                        Word(name: "three", image: UIImage(named: "3")!),
                        Word(name: "four", image: UIImage(named: "4")!),
                        Word(name: "five", image: UIImage(named: "5")!),
                        Word(name: "six", image: UIImage(named: "6")!),
                        Word(name: "seven", image: UIImage(named: "7")!),
                        Word(name: "eight", image: UIImage(named: "8")!),
                        Word(name: "nine", image: UIImage(named: "9")!)]
    
    let jobsArray = [Word(name: "Clown", image: UIImage(named: "Clown")!),
                     Word(name: "Builder", image: UIImage(named: "Builder")!),
                     Word(name: "Dantist", image: UIImage(named: "Dantist")!),
                     Word(name: "Doctor", image: UIImage(named: "Doctor")!),
                     Word(name: "Farmer", image: UIImage(named: "Farmer")!),
                     Word(name: "Fireman", image: UIImage(named: "Fireman")!),
                     Word(name: "Hunter", image: UIImage(named: "Hunter")!),
                     Word(name: "Painter", image: UIImage(named: "Painter")!),
                     Word(name: "Photographer", image: UIImage(named: "Photographer")!),
                     Word(name: "Seamstress", image: UIImage(named: "Seamstress")!),
                     Word(name: "Programist", image: UIImage(named: "Programist")!),
                     Word(name: "Waiter", image: UIImage(named: "Waiter")!)]
    
    let pronounsArray = [Word(name: "He", image: UIImage(named: "He")!),
                         Word(name: "I", image: UIImage(named: "I")!),
                         Word(name: "It", image: UIImage(named: "It")!),
                         Word(name: "She", image: UIImage(named: "She")!),
                         Word(name: "They", image: UIImage(named: "They")!),
                         Word(name: "We", image: UIImage(named: "We")!),
                         Word(name: "You", image: UIImage(named: "You")!)]
    
    let sectionNamesArray = ["Verbs", "Numbers", "Jobs", "Pronouns"]
    
    static let shared = GamesCollectionBase()
    private init() {
        self.sectionsArray = [verbsArray, numbersArray, jobsArray, pronounsArray]
    }
    
}
