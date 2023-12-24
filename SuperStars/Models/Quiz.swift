//
//  Quiz.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import Foundation

struct Quiz {
    let question: String
    let answerOptions: [String]
    let correctIndex: Int
    
    static func getQuizData() -> [Quiz] {
        [
            Quiz(
                question: "This hero is able to use TELEPATHY, which is communication between minds by some means other than sensory perception.",
                answerOptions: ["Spider-Man", "Cyclops", "Professor X", "Rogue"],
                correctIndex: 3
            ),
            Quiz(
                question: "This hero has had the power of NECROMANCY, the ability to speak to or control the dead.",
                answerOptions: ["Dr Doom", "Bloodwynd", "The Joker", "Kingpin"],
                correctIndex: 2
            ),
            Quiz(
                question: "This hero is capable of TELEPORTATION, the ability to instantaneously move across a distance. ",
                answerOptions: ["Nightcrawler", "Captain America", "Juggernaut", "Superman"],
                correctIndex: 0
            ),
            Quiz(
                question: "THEURGY is the ability to summon gods to intervene in human affairs. Which hero has a unique connection to the gods, including Zeus, and their powers?",
                answerOptions: ["Wolverine", "Moon Knight", "Jean Grey", "Shazam"],
                correctIndex: 3
            ),
            Quiz(
                question: "This hero nearly has INVINCIBILITY, meaning they are not able to be hurt or injured, unless exposed to Kryptonite.",
                answerOptions: ["Star Lord", "Superman", "Professor X", "Rogue"],
                correctIndex: 0
            ),
            Quiz(
                question: "This hero is able to use TELEKINESIS, the ability to move things with their mind or psychic power. ",
                answerOptions: ["Robin", "Cyborg", "Raven", "Starfire"],
                correctIndex: 2
            ),
            Quiz(
                question: "Do you know the term PYROMANCY? It means the ability to control fire. What hero can do that?",
                answerOptions: ["The Flash", "Human Torch", "Iron Man", "Daredevil"],
                correctIndex: 1
            ),
            Quiz(
                question: "This hero has superhuman MARKSMANSHIP, which is the ability to shoot things.",
                answerOptions: ["Green Arrow", "Green Lantern", "Green Goblin", "The Ninja Turtles"],
                correctIndex: 0
            )

        ]
    }
}
