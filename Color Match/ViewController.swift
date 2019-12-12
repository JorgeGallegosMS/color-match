//
//  ViewController.swift
//  Color Match
//
//  Created by Jorge Gallegos on 12/7/19.
//  Copyright © 2019 Jorge Gallegos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var coloredWord: UILabel!
    @IBOutlet weak var streakLabel: UILabel!
    
    // A list of colors for word label
    var textColors: [String] = ["red", "blue", "green", "yellow", "white"]
    
    // A dictionary of UIColors to manipulate colredWord
    var wordColors: [String:UIColor] = [
        "red":UIColor.red,
        "blue":UIColor.blue,
        "green":UIColor.green,
        "yellow":UIColor.yellow,
        "white":UIColor.white
    ]
    
    var streak: Int = 0 {
        didSet {
            streakLabel.text = "Streak: \(String(streak))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        resetWords()
    }
    
    func setup() {
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        word.backgroundColor = UIColor.black
        coloredWord.backgroundColor = UIColor.black
        word.backgroundColor = UIColor.black
        coloredWord.backgroundColor = UIColor.black
        streakLabel.backgroundColor = UIColor.black
    }
    
    func resetWords() {
        let wordLabel = textColors[Int.random(in: 0..<textColors.count)]
        let labelText = textColors[Int.random(in: 0..<textColors.count)]
        let labelTextColor = textColors[Int.random(in: 0..<textColors.count)]
        
        word.text = wordLabel
        coloredWord.text = labelText
        coloredWord.textColor = wordColors[labelTextColor]
    }
    @IBAction func yesButton(_ sender: Any) {
        let color = wordColors[word.text!]
        if color == coloredWord.textColor {
            streak += 1
            resetWords()
        } else {
            streak = 0
            resetWords()
        }
    }
    @IBAction func noButton(_ sender: Any) {
        let color = wordColors[word.text!]
        if color != coloredWord.textColor {
            streak += 1
            resetWords()
        } else {
            streak = 0
            resetWords()
        }
    }
}

