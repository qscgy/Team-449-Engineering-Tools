//
//  PneumForceViewController.swift
//  Team 449 Engineering Tools
//
//  Created by Sam Ehrenstein on 5/3/16.
//  Copyright © 2016 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit

class PneumForceViewController: UIViewController {

    @IBOutlet weak var diameterField: UITextField!
    @IBOutlet weak var pressureField: UITextField!
    @IBOutlet weak var forceOutput: UILabel!
    let pi=M_PI
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateForce(sender: AnyObject) {
        let pressure=Double(pressureField.text!)
        let diameter=Double(diameterField.text!)
        guard let force=pressure!*pi*(diameter!/2)*(diameter!/2) as Double! else {return}
        forceOutput.text="Force: \(force) lbf"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
