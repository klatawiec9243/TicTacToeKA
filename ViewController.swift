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
    @IBOutlet weak var winner: UILabel!
    
    var letters = "XOXOXOXOXOXOXOXOX"
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
                counter++
                if counter == 9
                {
                    counter = resetGameWin()
                }
            }
        }
        getAndSetCurrentLetter()
        
        if one.text == two.text && two.text == three.text && three.text != "" //left
        {
            winner.text = "1"
            resetGameWin()
        }
        else if four.text == five.text && five.text == six.text && six.text != "" //middle down
        {
            winner.text = "2"
            resetGameWin()
        }
        else if seven.text == eight.text && eight.text == nine.text && nine.text != "" //right
        {
            winner.text = "3"
            resetGameWin()
        }
        else if one.text == four.text && four.text == seven.text && seven.text != "" //top
        {
            winner.text = "4"
            resetGameWin()
        }
        else if two.text == five.text && five.text == eight.text && eight.text != "" //middle across
        {
            winner.text = "5"
            resetGameWin()
        }
        else if three.text == six.text && six.text == nine.text && nine.text != "" //bottom
        {
            winner.text = "6"
            resetGameWin()
        }
        else if seven.text == five.text && five.text == three.text && three.text != "" //diagonal left to right
        {
            winner.text = "7"
            resetGameWin()
        }
        else if one.text == five.text && five.text == nine.text && nine.text != "" //diagonal right to left
        {
            winner.text = "8"
            resetGameWin()
        }
    }

    func getAndSetCurrentLetter()
    {
        currentLetter = letters[letters.startIndex.advancedBy(counter)]
        currentPlayerLabel.text = String(currentLetter)
    }
    func resetGameWin() ->Int
    {
        let alert = UIAlertController(title: "Reseting Game", message: "\(winner.text)Winner! To play again, tap OK", preferredStyle: .Alert)
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
                self.winner.text = ""
                self.counter = 0
                self.currentLetter = "X"
        })
        
        
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        return 0
    }
    
}