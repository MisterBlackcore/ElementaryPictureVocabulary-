//
//  GamesCollectionViewCell.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/4/20.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sectionPictureImageView: UIImageView!
    
    //MARK: - Flow Functions
    
    func customizeGamesCollectionViewCell(name: String) {
        sectionPictureImageView.layer.cornerRadius = 10
        sectionPictureImageView.layer.borderWidth = 2
        sectionPictureImageView.layer.borderColor = UIColor.black.cgColor
        sectionPictureImageView.contentMode = .scaleAspectFit
        sectionPictureImageView.image = UIImage(named: name) 
    }
    
}
