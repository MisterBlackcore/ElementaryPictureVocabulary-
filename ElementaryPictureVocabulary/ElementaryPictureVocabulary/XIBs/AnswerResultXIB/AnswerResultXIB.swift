//
//  AnswerResultXIB.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/4/20.
//

import UIKit

class AnswerResultXIB: UIView {

    @IBOutlet weak var showAnswerImageView: UIImageView!
    
    class func instanceFromNib() -> AnswerResultXIB {
        return UINib(nibName: "AnswerResultXIB", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AnswerResultXIB
    }

}
