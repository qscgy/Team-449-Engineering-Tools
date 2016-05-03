//
//  GearRationViewController.swift
//  Team 449 Engineering Tools
//
//  Created by Sam Ehrenstein on 5/2/16.
//  Copyright © 2016 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit

class GearRatioViewController: UIViewController {

    @IBOutlet weak var stallTorqueField: UITextField!
    @IBOutlet weak var freeSpeedField: UITextField!
    @IBOutlet weak var stallCurrentField: UITextField!
    @IBOutlet weak var freeCurrentField: UITextField!
    @IBOutlet weak var desiredCurrentField: UITextField!
    @IBOutlet weak var loadField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(sender: AnyObject) {
        //TODO add a way of handling invalid values
        let stallTorque=Double(stallTorqueField.text!)
        let freeSpeed=Double(freeSpeedField.text!)
        let stallCurrent=Double(stallCurrentField.text!)
        let freeCurrent=Double(freeCurrentField.text!)
        let desiredCurrent=Double(desiredCurrentField.text!)
        let load=Double(loadField.text!)
        
        var 
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
