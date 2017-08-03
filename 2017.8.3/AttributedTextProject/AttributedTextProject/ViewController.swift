//
//  ViewController.swift
//  AttributedTextProject
//
//  Created by Benny Davidovitz on 03/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adjustLabel()
        
    }
    
    func adjustLabel(){
        guard let text = label.text else {
            return
        }
        
        let attString = NSMutableAttributedString(string: text)

        let spaceRange : NSRange = (text as NSString).range(of: " ")
        let firstWordRange = NSRange(location: 0, length: spaceRange.location)
        
        let strLen = (text as NSString).length
        let start = spaceRange.location + spaceRange.length
        
        let secondWordRange = NSRange(location: start, length: strLen - start)
        
        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: firstWordRange)
        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.yellow, range: secondWordRange)
        
        attString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: strLen))
        
        attString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleNone.rawValue, range: spaceRange)
        
        attString.addAttribute(NSStrikethroughStyleAttributeName, value: (NSUnderlineStyle.styleSingle.rawValue as NSNumber), range: firstWordRange)
        
//        let winRange = NSRange(location: 0, length: 3)
//        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: winRange)
        
        label.attributedText = attString
    }



}
















