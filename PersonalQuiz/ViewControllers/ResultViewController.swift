//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    private var animal: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)

        animal = findAnimal()
        animalLabel.text = "ВЫ - \(animal?.rawValue ?? ".")!"
        definitionLabel.text = animal?.definition ?? ""
    }
    
    private func findAnimal() -> Animal? {
        var quantityOfAnimals: [Animal: Int] = [:]

        let animals = answersChosen.compactMap { $0.animal }
        for animal in animals {
            quantityOfAnimals[animal] = (quantityOfAnimals[animal] ?? 0) + 1
        }
        return quantityOfAnimals.sorted { $0.value > $1.value }.first?.key
    }
}
