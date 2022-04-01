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
    var crash = 0
    var image: UIImage = UIImage(named: "bug1")!
  
    @IBOutlet weak var llose: UILabel!
    override func viewDidLoad()
    {
    

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        
        lable = UILabel(frame: CGRect(x: 200, y: 50, width: 100, height: 50))
        lable.textColor = UIColor.black
        lable.text = "\(counter)"
        view.addSubview(lable)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        for view in view.subviews
        {
            if view.tag == 3
            {
                view.removeFromSuperview()
            }
        }
    
        startGame()
    }
    
    func startGame()
    {
        // remove all stuff.. reset scores, etc
        counter = 0
        bcount = 0
        speed = 1.0
        crash = 0
        view.addSubview(lable)
        lable.text = "\(counter)"

        createButton()
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
    counter += 1
        lable.text = "\(counter)"
        bcount -= 1
    }
    @objc func createButton()
    {
        let randx = CGFloat.random(in: 0...UIScreen.main.bounds.width-100)
        let randy = CGFloat.random(in: 0...UIScreen.main.bounds.height-25)
        var Button1 = UIButton (frame: CGRect(x: randx, y: randy, width: 100, height: 100))
        self.Button1a.append(Button1)
        Button1.setTitle("press me", for: .normal)
        Button1.setImage(image, for: UIControl.State.normal)
        view.addSubview(Button1)
        Button1.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        Button1.tag = 3
        //animation
      
        
        
        
        
    }
    @objc func fireTimer() {
        createButton()
        bcount += 1
        print(speed)
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
//            self.llose.alpha = 1
//            self.llose.bringSubviewToFront(self.llose)
//            let Button2 = UIButton (frame: CGRect(x: 155, y: 500, width: 100, height: 100))
//            Button2.setTitle("reset", for: .normal)
//            Button2.backgroundColor = UIColor.red
//            view.addSubview(Button2)
//            Button2.addTarget(self, action: #selector(restbutton), for: .touchUpInside)
            for btn in Button1a
            {
                crash += 1
                btn.removeFromSuperview()
                print("f")
               
                if crash == 100 {
                   break
                }
               
                

                performSegue(withIdentifier: "gameOverSegue", sender: self)
                break
                
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "gameOverSegue")
            {
                let scoreseg = segue.destination as! Gameover
                scoreseg.scoresave = counter
            }
    }
}

