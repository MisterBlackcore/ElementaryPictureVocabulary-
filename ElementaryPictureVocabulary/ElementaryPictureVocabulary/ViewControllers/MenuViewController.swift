//
//  ViewController.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/4/20.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    //MARK: - Main Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background2")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeAppNameLabel()
        customizeStartButton()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - IBActions
    
    @IBAction func startButtonIsPressed(_ sender: UIButton) {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "GamesViewController") as? GamesViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
            }
    }
    
    //MARK: - Flow Functions

    func customizeAppNameLabel() {
        appNameLabel.textColor = .white
        appNameLabel.text = "Elementary Picture Vocabulary"
    }

    func customizeStartButton() {
        startButton.setTitle("START NEW GAME", for: .normal)
        startButton.backgroundColor = UIColor(displayP3Red: 139/255, green: 69/255, blue: 19/255, alpha: 1)
        startButton.layer.cornerRadius = 20
        startButton.setTitleColor(.black, for: .normal)

        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowRadius = 20
        startButton.layer.shadowOpacity = 1.0
    }
}
