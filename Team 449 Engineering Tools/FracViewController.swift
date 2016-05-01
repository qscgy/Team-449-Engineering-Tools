//
//  FracViewController.swift
//  Team 449 Engineering Tools
//
//  Created by Sam Ehrenstein on 2/25/16.
//  Copyright © 2016 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit

class FracViewController: UIViewController {

    @IBOutlet weak var chart:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle=NSBundle.mainBundle()
        let path=bundle.pathForResource("fracchart", ofType: "csv")
        do {
        let content=try String(contentsOfFile: path!)
        chart.text=content
        } catch let err as NSError {
            print(err.localizedDescription)
        }
    }
}
