//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnimalLabel: UILabel!
    @IBOutlet weak var descriptionAnimalLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        guard  let answers = answers else { return }
        let resultAnimal = getResult(from: answers)
        resultAnimalLabel.text = "Вы - \(resultAnimal.rawValue)"
        descriptionAnimalLabel.text = resultAnimal.definition
    }

}

// MARK: - Private Methods
extension ResultViewController {
    
    private func getResult(from answers: [Answer]) -> Animal {
        //Решение № 1
        //        let totalAnswers = answers.map { $0.animal }
        //            .reduce(into: [:]) { counts,  animalInAnswer in counts[animalInAnswer, default: 0] += 1 }
        //            .sorted(by: { $0.value > $1.value })
        //
        //        return totalAnswers[0].key
        
        //Решение №2
        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal }
            .sorted{ $0.value.count > $1.value.count }
            .first?.key
        
        return mostFrequencyAnimal!
    }
    
}
