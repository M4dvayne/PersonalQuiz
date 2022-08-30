//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Вячеслав Кремнев on 1/31/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var userResult: [Answer]!
    
    @IBOutlet weak var emojiResult: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        getResult()
    }
    
    func getResult() {
        
        var duplicatedAnimals: [Animal: Int] = [:]
        
        let animals = userResult.map { $0.animal }
        
        for animal in animals {
            if let existingAnimal = duplicatedAnimals[animal] {
                duplicatedAnimals.updateValue(existingAnimal + 1, forKey: animal)
            } else {
                duplicatedAnimals[animal] = 1
            }
        }
        let sortedAnimals = duplicatedAnimals.sorted {$0.value > $1.value}
        guard let repeatedAnimal = sortedAnimals.first?.key else {return}
        
        updateUserResult(with: repeatedAnimal)
    }
    
    private func updateUserResult(with animal: Animal) {
        emojiResult.text = "Вы - \(animal.rawValue)"
        resultDescription.text = animal.definition
    }
}
