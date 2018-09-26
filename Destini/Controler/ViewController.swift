//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let allStory = StoryBank()
    var step = 1
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    // TODO Step 5: Initialise instance variables here
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restart()

    }

    @IBAction func restartPressed(_ sender: Any) {
        
        restart()
        
    }
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1  && (step == 1 || step == 2) {
            
            step = 3
            storyTextView.text = allStory.list[step - 1].storyText
            topButton.setTitle(allStory.list[step - 1].answer1, for: .normal)
            bottomButton.setTitle(allStory.list[step - 1].answer2, for: .normal)
     
        } else if sender.tag == 2 && step == 1 {
           
            step = 2
            storyTextView.text = allStory.list[step - 1].storyText
            topButton.setTitle(allStory.list[step - 1].answer1, for: .normal)
            bottomButton.setTitle(allStory.list[step - 1].answer2, for: .normal)
          
        } else if sender.tag == 2 && step == 2 {
            
            step = 4
            storyTextView.text = allStory.list[step - 1].storyText
            topButton.isHidden = true
            bottomButton.isHidden = true
            popUp()
            
        } else if sender.tag == 1 && step == 3 {
            
            step = 6
            storyTextView.text = allStory.list[step - 1].storyText
            topButton.isHidden = true
            bottomButton.isHidden = true
            popUp()
            
        } else if sender.tag == 2 && step == 3 {
            
            step = 5
            storyTextView.text = allStory.list[step - 1].storyText
            topButton.isHidden = true
            bottomButton.isHidden = true
            popUp()
            
        } 
    }

    
    func popUp() {
        
        let alert = UIAlertController(title: "Awesome", message: "You've finished the story line?", preferredStyle: .actionSheet)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in self.restart() }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(UIAlertAction) in self.cancel()}

        alert.addAction(restartAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    

    
    func restart() {
        
        step = 1
        storyTextView.text = allStory.list[step - 1].storyText
        topButton.isHidden = false
        bottomButton.isHidden = false
        topButton.setTitle(allStory.list[step - 1].answer1, for: .normal)
        bottomButton.setTitle(allStory.list[step - 1].answer2, for: .normal)
        restartButton.isHidden = true
        
    
        }
    func cancel() {
        
        restartButton.isHidden = false
        
    }
    
   
}

