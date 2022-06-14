//
//  HardLose.swift
//  Button Move
//
//  Created by  on 6/14/22.
//

import UIKit

class HardLose: UIViewController {
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var high: UILabel!
    var scoresave2 = 2
    var scorehighest2 = 3
    override func viewDidLoad() {
        super.viewDidLoad()
      //this is were you left off
        scoreLable.text = "\(scoresave2)"

        loadFromUserDefaults()
        high.text = "\(scorehighest2)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        print(1)
        self.navigationController?.popToRootViewController(animated: true)
    }
    //    @IBAction func homeBtn(_ sender: Any)
//    {
//        print(1)
//        self.navigationController?.popToRootViewController(animated: true)
//    }
//    @IBAction func resetbtn(_ sender: Any)
//    {
//        self.navigationController?.popViewController(animated: false)
//    }
    @IBAction func resetBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    func loadFromUserDefaults()
    {
        let defaults = UserDefaults.standard
        scorehighest2 = defaults.integer(forKey: "finaly2")
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
