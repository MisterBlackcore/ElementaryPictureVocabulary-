//
//  GamesViewController.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/4/20.
//

import UIKit

class GamesViewController: UIViewController {
    
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
    //MARK: - Main Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        customizeNavigationBar()
        gamesCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: "background4")!)
    }
    
    //MARK: - Flow Functions
    
    func customizeNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.backButtonTitle = "Back"
        self.navigationItem.title = "Choose Game"
        
    }
    
}

    //MARK: - Extensions

extension GamesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GamesCollectionBaseManager.shared.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as? GamesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cellPicture = GamesCollectionBaseManager.shared.pictureOfSection()[indexPath.row]
        cell.customizeGamesCollectionViewCell(name: cellPicture)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "GameSceneViewController") as? GameSceneViewController {
            viewController.chosenSection = GamesCollectionBaseManager.shared.returnSection()[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 - 5, height: collectionView.frame.size.width/2 - 5)
    }

}
