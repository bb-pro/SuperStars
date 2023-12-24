//
//  QuizVC.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import UIKit

@available(iOS 13.0, *)
final class QuizVC: BaseViewController {

    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var answerBtns: [UIButton]!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextBtn: UIButton!
    
    private let data = Quiz.getQuizData()
    private var currentIndex = 0
    private var correctCount = 0
    private var selectedTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        let quiz = data[currentIndex]
        numberLabel.text = "\(currentIndex + 1)/8"
        questionLabel.text = quiz.question
        for (index, info) in quiz.answerOptions.enumerated() {
            answerBtns[index].setTitle(info, for: .normal)
        }
        answerBtns.forEach { btn in
            btn.backgroundColor = .white
        }
        nextBtn.alpha = 0.5
        nextBtn.isEnabled = false
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        nextBtn.alpha = 1
        nextBtn.isEnabled = true
        answerBtns.forEach { btn in
            btn.backgroundColor = .white
        }
        sender.backgroundColor = .yellow
        selectedTag = sender.tag
    }
    
    @IBAction func nextPressed() {
        let quiz = data[currentIndex]
        if quiz.correctIndex == selectedTag {
            correctCount += 1
        }
        if currentIndex < data.count - 1 {
            currentIndex += 1
            updateUI()
        } else {
            let resultVC = main.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
            
            resultVC.result = String(correctCount)
            push(vc: resultVC)
        }
    }
    
}
