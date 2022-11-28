//
//  ViewController.swift
//  quizappnew
//
//  Created by Zakkariya K.A on 29/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Qwestion: UILabel!
    @IBOutlet weak var firstop: UIButton!
    @IBOutlet weak var secondop: UIButton!
    @IBOutlet weak var thirdop: UIButton!
    @IBOutlet weak var fourthop: UIButton!
    
    @IBOutlet weak var lblprogress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentQuestion = questions[0]
                setQuestion()
                setGradientBackground()
    }

    @IBAction func First(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func Second(_ sender: Any) {
        checkAnswer(idx: 1)
        
    }
    
    @IBAction func Third(_ sender: Any) {
        checkAnswer(idx: 2)
        
    }
    
    @IBAction func Fourth(_ sender: Any) {
        checkAnswer(idx: 3)
        
    }
    
    struct Question {
            let question: String
            let answers: [String]
            let correctAnswer: Int
        }
        
        
        var questions: [Question] = [
            Question(
                question: "What is 1+1?",
                answers: ["1", "2", "3", "4"],
                correctAnswer: 1),
            Question(
                question: "Apple is a?",
                answers: ["Fruit", "Vegetale", "Both", "None"],
                correctAnswer: 0),
            Question(
                question: "What is the Capital of India?",
                answers: ["Colombia", "Melbourne", "New Delhi", "Canberra"],
                correctAnswer: 3)
        ]
        
        var currentQuestion: Question?
        var currentQuestionPos = 0
        
        var noCorrect = 0
    
    
    func checkAnswer(idx: Int) {
            if(idx == currentQuestion!.correctAnswer) {
                noCorrect += 1
            }
            loadNextQuestion()
        }
        
        func loadNextQuestion() {
            
            if(currentQuestionPos + 1 < questions.count) {
                currentQuestionPos += 1
                currentQuestion = questions[currentQuestionPos]
                setQuestion()
           
            } else {
                performSegue(withIdentifier: "sgShowResults", sender: nil)
            }
            

        }
        
        
        func setQuestion() {
          Qwestion.text = currentQuestion!.question
            firstop.setTitle(currentQuestion!.answers[0], for: .normal)
         secondop.setTitle(currentQuestion!.answers[1], for: .normal)
            thirdop.setTitle(currentQuestion!.answers[2], for: .normal)
           fourthop.setTitle(currentQuestion!.answers[3], for: .normal)
            lblprogress.text = "\(currentQuestionPos + 1) / \(questions.count)"
        }
       
        func setGradientBackground() {
            let colorTop =  UIColor.black.cgColor
            let colorBottom = UIColor.blue.cgColor
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [ colorTop, colorBottom]
            gradientLayer.locations = [ 0.0, 1.0]
            gradientLayer.frame = self.view.bounds
            
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        }
        
      
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "sgShowResults") {
                var vc = segue.destination as! SecondVC
                vc.noCorrect = noCorrect
                vc.total = questions.count
            }
        }
    
    
    
    
}

