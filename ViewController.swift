//
//  ViewController.swift
//  TicTacToeKA
//
//  Created by Kasper Latawiec on 2/25/16.
//  Copyright © 2016 BGHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var six: UILabel!
    @IBOutlet weak var seven: UILabel!
    @IBOutlet weak var eight: UILabel!
    @IBOutlet weak var nine: UILabel!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    var plays: [String:Int] = [
        "X":5,
        "O":1
    ]
    
    var letters = "XOXOXOXOXOXOXOXOXO"
    var counter = 0
    var currentLetter: Character!
    var labelArray = [UILabel()]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelArray = [one, two, three, four, five, six, seven, eight, nine]
        getAndSetCurrentLetter()
    }
    
    @IBAction func whenTapped(sender: UITapGestureRecognizer)
    {
        var selectedPoint = sender.locationInView(self.view)
        for label in labelArray {
            if CGRectContainsPoint(label.frame, selectedPoint)
            {
                label.text = String(currentLetter)
            }
        }
        counter++
        if counter == 9
        {
            counter = resetGame()
        }
        getAndSetCurrentLetter()
    }
    
    func getAndSetCurrentLetter()
    {
        currentLetter = letters[letters.startIndex.advancedBy(counter)]
        currentPlayerLabel.text = String(currentLetter)
    }
    
    func resetGame() ->Int
    {
        let alert = UIAlertController(title: "Reseting Game", message: "To play again, tap OK", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler:
            {
                sender in
                self.one.text = ""
                self.two.text = ""
                self.three.text = ""
                self.four.text = ""
                self.five.text = ""
                self.six.text = ""
                self.seven.text = ""
                self.eight.text = ""
                self.nine.text = ""
        })
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        return 0
    }
    
    func win()
    {
        
    }