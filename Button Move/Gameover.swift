//
//  Gameover.swift
//  Button Move
//
//  Created by  on 3/24/22.
//

import UIKit

class Gameover: UIViewController {
    @IBOutlet weak var scoreLable: UILabel!
    var scoresave = 2
    override func viewDidLoad() {
        super.viewDidLoad()
      //this is were you left off
        scoreLable.text = "\(scoresave)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeBtn(_ sender: Any)
    {
        print(1)
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func resetbtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: false)
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
