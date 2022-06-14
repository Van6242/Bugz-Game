//
//  HardController.swift
//  Button Move
//
//  Created by  on 6/13/22.
//

import UIKit

class HardController: UIViewController
{
    var lable = UILabel()
    var counter = 0
    var bcount = 0
    var timer = Timer()
    var speed = 1.0
    var Button1a = [UIButton]()
    var crash = 0
    var image: UIImage = UIImage(named: "bug1")!
    var highscore2 = 0
   
  
    override func viewDidLoad()
    {

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        
//        lable = UILabel(frame: CGRect(x: 200, y: 50, width: 100, height: 50))
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.adjustsFontSizeToFitWidth = false
        lable.font = UIFont.systemFont(ofSize: 40.0)
        lable.textColor = UIColor.black
        lable.text = "\(counter)"
        view.addSubview(lable)
        loadFromUserDefaults()
        addconst()
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
        let randy = CGFloat.random(in: 0...UIScreen.main.bounds.height-100)
        var Button1 = UIButton (frame: CGRect(x: randx, y: randy, width: 100, height: 100))
        self.Button1a.append(Button1)
        Button1.setTitle("press me", for: .normal)
        Button1.setImage(image, for: UIControl.State.normal)
        view.addSubview(Button1)
        Button1.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        Button1.tag = 3
        //animation
      
        
        
        
        
    }
    
    @IBAction func hardbackbtn(_ sender: Any) {
            timer.invalidate()

            for btn in Button1a
            {
                crash += 1
                btn.removeFromSuperview()
                print("f")
               
                if crash == 100 {
                   break
                }
               
                
print(bcount)
                
                break
                
                
            }
           
           
            if counter >= highscore2
       {
        highscore2 = counter
       saveFromUserDefaults()
        
       }
            performSegue(withIdentifier: "gameOverSegue2", sender: self)
        }
    
    
    
    
    
    
    @objc func fireTimer() {
        createButton()
        bcount += 1
        print(speed)
    }
    
       
   
      
   
    
    @objc func rescheduleTimer()
    {
        

        
        
        self.bcount += 1
        print(bcount)
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
        if counter > 100
        {
            timer.invalidate()
            speed = 0.15
            timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(rescheduleTimer), userInfo: nil, repeats: true)
        }
        if self.bcount == 5
        {
            timer.invalidate()

            for btn in Button1a
            {
                crash += 1
                btn.removeFromSuperview()
                print("f")
               
                if crash == 100 {
                   break
                }
               
                
print(bcount)
                
                break
                
                
            }
           
           
            if counter >= highscore2
       {
        highscore2 = counter
       saveFromUserDefaults()
        
       }
            performSegue(withIdentifier: "gameOverSegue2", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "gameOverSegue2")
            {
                let scoreseg = segue.destination as! HardLose
                scoreseg.scoresave2 = counter
            }
    }
    
    
    func loadFromUserDefaults(){
        let defaults = UserDefaults.standard
        highscore2 = defaults.integer(forKey: "finaly2")
        
    }
    
    
    func saveFromUserDefaults(){
        let defaults = UserDefaults.standard
        defaults.setValue(highscore2, forKey: "finaly2")
    }
    func addconst()
    {
        var constr = [NSLayoutConstraint]()
//        constr.append(lable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100))
//        constr.append(lable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 100))
//        constr.append(lable.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constr.append(lable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constr.append(lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50))
//        constr.append(lable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 100))
        NSLayoutConstraint.activate(constr)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
