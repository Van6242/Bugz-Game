//
//  ViewController.swift
//  Button Move
//
//  Created by  on 3/1/22.
//

import UIKit
var timer = Timer()
class ViewController: UIViewController
{
    var lable = UILabel()
    var counter = 0
    var bcount = 0
    var timer = Timer()
    var speed = 1.0
    var Button1a = [UIButton]()
    
    
    @IBOutlet weak var llose: UILabel!
    override func viewDidLoad()
    {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lable = UILabel(frame: CGRect(x: 200, y: 50, width: 100, height: 50))
        lable.textColor = UIColor.black
        lable.text = "\(counter)"
        view.addSubview(lable)
        
        startGame()
        
        
        
        
        
//        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
//        Timer.scheduledTimer(withTimeInterval: speed, repeats: false) { [self] timer in
//            self.bcount += 1
//            self.createButton()
//            if self.bcount >= 5
//            {
//                timer.invalidate()
//                self.llose.alpha = 1
//                self.llose.bringSubviewToFront(self.llose)
//            }
//
//            stime()
//
//        }
        
    
        
        
    }
    
    func startGame()
    {
        // remove all stuff.. reset scores, etc
      
        counter = 0
        bcount = 0
        speed = 1.0
        
      
      
        view.addSubview(lable)
        view.addSubview(llose)
        lable.text = "\(counter)"
        llose.alpha = 0
        
        
        createButton()
//        stime()
        timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(rescheduleTimer), userInfo: nil, repeats: true)
       
        }
     
    
    
    @objc func restbutton (sender: UIButton)
    {
        print("jump")
        sender.removeFromSuperview()
        
        
        startGame()
        
        
    }
    
    
    
    @objc func buttonPressed (sender: UIButton)
    {
        print(speed)
        print("button pressed")
        sender.removeFromSuperview()
//        createButton()
      
    counter += 1
        lable.text = "\(counter)"
        bcount -= 1
      
        
       
    
        
//        if bcount >= 5{
//            print("over")
//        ahhhhhhhhhhhhhhhhhhhhhhhhh
        
//        }
    }
    
    @objc func createButton()
    {
        let randx = CGFloat.random(in: 0...UIScreen.main.bounds.width-100)
        let randy = CGFloat.random(in: 0...UIScreen.main.bounds.height-25)
        
        var Button1 = UIButton (frame: CGRect(x: randx, y: randy, width: 100, height: 100))
        self.Button1a.append(Button1)
        Button1.setTitle("press me", for: .normal)
        Button1.backgroundColor = UIColor.green
        view.addSubview(Button1)

        Button1.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
   

    }
    @objc func fireTimer() {
        createButton()
        bcount += 1
        print(speed)
   
            
        
//        if bcount >= 5{
//            print("over")
//            timer.invalidate()
//
//
//        }
    }
    
    @objc func rescheduleTimer()
    {
        self.bcount += 1
        self.createButton()
        
        if counter > 5
        {
            timer.invalidate()
            speed = 0.75
            timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(rescheduleTimer), userInfo: nil, repeats: true)
        }
        
        if counter > 15
        {
            timer.invalidate()
            speed = 0.5
            timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(rescheduleTimer), userInfo: nil, repeats: true)
        }
        if counter > 20
        {
            timer.invalidate()
            speed = 0.25
            timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(rescheduleTimer), userInfo: nil, repeats: true)
        }
        
        
        
        
        if self.bcount > 5
        {
            timer.invalidate()
            self.llose.alpha = 1
            self.llose.bringSubviewToFront(self.llose)
            
            
            let Button2 = UIButton (frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            Button2.setTitle("reset", for: .normal)
            Button2.backgroundColor = UIColor.red
            view.addSubview(Button2)
            Button2.addTarget(self, action: #selector(restbutton), for: .touchUpInside)
            
            for btn in Button1a
            {
                btn.removeFromSuperview()
//                print("f")
            }
           
        }
    
     
        
        
        
    }
    
//    func stime () {
//
//        timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(rescheduleTimer), userInfo: nil, repeats: true)
//        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { [self] timer in
//        self.bcount += 1
//        self.createButton()
//        if self.bcount >= 5
//        {
//            timer.invalidate()
//            self.llose.alpha = 1
//            self.llose.bringSubviewToFront(self.llose)
//        }
//
//
//
//    }
//    timer.invalidate()
//    stime()
//    }
//
    
   
    
    
    
    
    


    
    
//if bcount is over 5 you lose
}
