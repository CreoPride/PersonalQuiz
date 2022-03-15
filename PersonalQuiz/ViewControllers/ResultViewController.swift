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
    
    // 1. Передать массив с ответами на экран с результатами ok
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов ok


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        animal = countAnimal()
        animalLabel.text = "ВЫ - \(animal?.rawValue ?? ".")!"
        definitionLabel.text = animal?.definition ?? ""

    }

    private func countAnimal() -> Animal? {
        var quantityOfAnimals: [Animal: Int] = [:]

        let animals = answersChosen.compactMap { $0.animal }
        for animal in animals {
            quantityOfAnimals[animal] = (quantityOfAnimals[animal] ?? 0) + 1
        }
        let animal = quantityOfAnimals.sorted { $0.value > $1.value }.first?.key
        return animal
    }
}
