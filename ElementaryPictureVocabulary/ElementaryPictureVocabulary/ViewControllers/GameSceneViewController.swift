//
//  GameSceneViewController.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/3/20.
//

import UIKit

class GameSceneViewController: UIViewController {

    @IBOutlet weak var ourImageView: UIImageView!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var fourthOptionButton: UIButton!
    
    var rightAnswer:String?
    
    var numberOfAnsweredQuestions = 0
    var numberOfRightAnsweredQuestions = 0
    
    var chosenSection:[Word] = []
    var optionsArray:[String] = []
    var buttonsArray:[UIButton] = []
    
    let resultsXIB = ResultsXIB.instanceFromNib()
    let answerResultXIB = AnswerResultXIB.instanceFromNib()
    
    //MARK: - Main Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background52")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillInButtonsArray()
        fillInOptionsArray()
        customizeImageView()
        customizeButtons()
        fillInGameScene()
    }
    
    //MARK: - IBActions
    
    @IBAction func firstOptionButtonIsPressed(_ sender: UIButton) {
        buttonTapAction(button: firstOptionButton)
    }
    
    @IBAction func secondOptionButtonIsPressed(_ sender: UIButton) {
        buttonTapAction(button: secondOptionButton)
    }
    
    @IBAction func thirdOptionButtonIsPressed(_ sender: UIButton) {
        buttonTapAction(button: thirdOptionButton)
    }
    
    @IBAction func fourthOptionButtonIsPressed(_ sender: UIButton) {
        buttonTapAction(button: fourthOptionButton)
    }
    
    @IBAction func returnToMenu() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func hideXIB() {
        removeResultXIB()
        if numberOfAnsweredQuestions == 5 {
            addResultsXIB()
        } else {
            showElements()
        }
    }
    
    //MARK: - Flow Functions
    
    func customizeImageView() {
        ourImageView.contentMode = .scaleToFill
        ourImageView.layer.borderColor = UIColor.black.cgColor
        ourImageView.layer.borderWidth = 3
        ourImageView.layer.cornerRadius = 20
    }
    
    func customizeButtons() {
        for element in buttonsArray {
            element.layer.cornerRadius = 10
            element.layer.borderWidth = 2
//            element.backgroundColor = UIColor(displayP3Red: 176/255, green: 224/255, blue: 230/255, alpha: 1)
            element.backgroundColor = UIColor(displayP3Red: 255/255, green: 228/255, blue: 181/255, alpha: 1)
            element.layer.borderColor = UIColor.black.cgColor
            element.setTitleColor(.black, for: .normal)
            
            element.layer.shadowColor = UIColor(displayP3Red: 139/255, green: 0/255, blue: 0/255, alpha: 1).cgColor

            element.layer.shadowRadius = 10
            element.layer.shadowOpacity = 1.0
        }
    }
    
    func removeResultXIB() {
        answerResultXIB.removeFromSuperview()
    }
    
    func fillInButtonsArray() {
        buttonsArray = [firstOptionButton, secondOptionButton, thirdOptionButton, fourthOptionButton]
    }
    
    func fillInOptionsArray() {
        for element in chosenSection {
            optionsArray.append(element.name)
        }
    }
    
    func fillInGameScene() {
        let wordIndex = Int.random(in: 0...chosenSection.count-1)
        ourImageView.image = chosenSection[wordIndex].image
        randomiseOptionsInButton(rightAnswerIndex: wordIndex)
    }
    
    func randomiseOptionsInButton(rightAnswerIndex: Int) {
        var optionsArrayForButton:[String] = [chosenSection[rightAnswerIndex].name]
        var filledOptionsNumber = 1
        rightAnswer = chosenSection[rightAnswerIndex].name
        optionsArray.remove(at: rightAnswerIndex)
        
        repeat {
            let wordIndex = Int.random(in: 0...optionsArray.count-1)
            optionsArrayForButton.append(optionsArray[wordIndex])
            optionsArray.remove(at: wordIndex)
            filledOptionsNumber += 1
        } while filledOptionsNumber != 4
        
        optionsArrayForButton.shuffle()
        fillInButton(optionsArray: optionsArrayForButton)
    }
    
    func fillInButton(optionsArray: [String]) {
        for (element, option) in zip(buttonsArray, optionsArray) {
            element.setTitle(option, for: .normal)
        }
    }
    
    func buttonTapAction(button: UIButton) {
        if checkButtonName(button: button) == rightAnswer {
            addAnswerResultXIB(answer: "True")
            numberOfRightAnsweredQuestions += 1
        } else {
            addAnswerResultXIB(answer: "False")
        }
        optionsArray = []
        numberOfAnsweredQuestions += 1
        checkButtonTapResult()
    }
    
    func checkButtonName(button: UIButton) -> String {
        return button.currentTitle!
    }
    
    func checkButtonTapResult() {
        if numberOfAnsweredQuestions == 5 {
            hideElements()
        } else {
            fillInOptionsArray()
            fillInGameScene()
        }
    }
    
    func hideElements() {
        ourImageView.isHidden = true
        firstOptionButton.isHidden = true
        secondOptionButton.isHidden = true
        thirdOptionButton.isHidden = true
        fourthOptionButton.isHidden = true
    }
    
    func showElements() {
        ourImageView.isHidden = false
        firstOptionButton.isHidden = false
        secondOptionButton.isHidden = false
        thirdOptionButton.isHidden = false
        fourthOptionButton.isHidden = false
    }
    
    func addResultsXIB() {
        resultsXIB.backgroundColor = .black
        resultsXIB.layer.cornerRadius = 20
        resultsXIB.frame = CGRect(x: self.view.frame.width/6, y: self.view.frame.height, width: self.view.frame.width/1.5, height: self.view.frame.height/2)
        resultsXIB.showResultsLabel.alpha = 0
        view.addSubview(resultsXIB)
        
        moveResultsXIBUp()
    }

    func moveResultsXIBUp() {
        UIView.animate(withDuration: 2) {
            self.resultsXIB.frame.origin.y = self.view.frame.height/4
            self.resultsXIB.showResultsLabel.textColor = .white
            self.resultsXIB.showResultsLabel.text = "Your score is \(self.numberOfRightAnsweredQuestions) from \(self.numberOfAnsweredQuestions)"
        } completion: { (_) in
            self.showTextOnResultsXIBAndAddTapOnIt()
        }
    }
    
    func showTextOnResultsXIBAndAddTapOnIt() {
        UIView.animate(withDuration: 2) {
            self.resultsXIB.showResultsLabel.alpha = 1
        } completion: { (_) in
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.returnToMenu))
            self.resultsXIB.addGestureRecognizer(tap)
        }
    }
    
    func addAnswerResultXIB(answer: String) {
        answerResultXIB.backgroundColor = .black
        answerResultXIB.layer.cornerRadius = 20
        answerResultXIB.layer.borderWidth = 5
        setBorderColorForAnswerResultXIB(answer: answer)
        answerResultXIB.frame = CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height/2 - self.view.frame.size.width/4, width: self.view.frame.size.width/2, height: self.view.frame.size.width/2)
        answerResultXIB.showAnswerImageView.image = UIImage(named: answer)
        answerResultXIB.showAnswerImageView.alpha = 0
        view.addSubview(answerResultXIB)
        moveAnswerResultXIBUp()
    }
    
    func setBorderColorForAnswerResultXIB(answer: String) {
        if answer == "True" {
            answerResultXIB.layer.borderColor = UIColor.green.cgColor
        } else {
            answerResultXIB.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func moveAnswerResultXIBUp() {
        UIView.animate(withDuration: 1) {
            self.hideElements()
            self.answerResultXIB.showAnswerImageView.alpha = 1
        } completion: { (_) in
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideXIB))
            self.answerResultXIB.addGestureRecognizer(tap)
        }
    }

}
