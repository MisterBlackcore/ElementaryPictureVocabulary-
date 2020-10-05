//
//  ResultsXIB.swift
//  ElementaryPictureVocabulary
//
//  Created by Batman on 10/4/20.
//

import UIKit

class ResultsXIB: UIView {

    @IBOutlet weak var showResultsLabel: UILabel!
    
    class func instanceFromNib() -> ResultsXIB {
        return UINib(nibName: "ResultsXIB", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ResultsXIB
    }

}
