//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let eggTime : [String:Int] =
        ["Soft" : 300,
         "Medium" : 420,
         "Hard" : 720]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer1 = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    var timer4 = Timer()
   
    @IBOutlet weak var label: UILabel!
    

    @IBOutlet weak var progressIndicator: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressIndicator.progress = 0.0
        timer1.invalidate()// to stop old timer
       
        secondsPassed = 0
        totalTime = 0
        
       
       /* timer2.invalidate()
        timer3.invalidate()
        timer4.invalidate()*/
       
        
        let hardness =  sender.currentTitle
        
        label.text = hardness
        
        if (hardness != nil)
        {
           totalTime = eggTime[hardness!]!
        }
        
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
        // i found another way
        
       /* if(hardness == "Soft")
        {
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateIndicator1), userInfo: nil, repeats: true)
        }
        if(hardness == "Medium")
        {
            timer3 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateIndicator2), userInfo: nil, repeats: true)
        }
        if(hardness == "Hard")
        {
          
            timer4 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateIndicator3), userInfo: nil, repeats: true)
        }*/
        
    }
    
    @objc func updateTimer()
    {
       
     if secondsPassed < totalTime
        {
          
          secondsPassed = secondsPassed + 1
         let percentageProgress = Float(secondsPassed) / Float(totalTime)
         progressIndicator.progress = percentageProgress
        }
        
       
        if progressIndicator.progress == 1
        {
            label.text = "Done!"
            
            timer1.invalidate()
        }
        
    }
    
    
    
    
    
  /*  @objc func updateIndicator1()
    {
            
        progressIndicator.progress = progressIndicator.progress + 1/300
        if(progressIndicator.progress == 1)
        {
            label.text = "Done!"
        }
        
          
    }
    @objc func updateIndicator2()
    {
        
        progressIndicator.progress = progressIndicator.progress + 1/420
        if(progressIndicator.progress == 1)
        {
            label.text = "Done!"
        }
        
    }
    @objc func updateIndicator3()
    {

          progressIndicator.progress = progressIndicator.progress + 1/720
        if(progressIndicator.progress == 1)
        {
            label.text = "Done!"
        }
    }*/
    
}
