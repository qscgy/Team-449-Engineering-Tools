//
//  FracViewController.swift
//  Team 449 Engineering Tools
//
//  Created by Sam Ehrenstein on 2/25/16.
//  Copyright © 2016 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit

class FracViewController: UITableViewController {
    
    var fracVals:[String]=[]
    var decVals:[String]=[]
    var mmVals:[String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle=NSBundle.mainBundle()
        let path=bundle.pathForResource("fracchart", ofType: "csv")
        do {
            let content=try String(contentsOfFile: path!)
            let data=content.componentsSeparatedByString("\n")
            for line in data{
                let lineArr=line.componentsSeparatedByString(",")
                fracVals.append(lineArr[0])
                decVals.append(lineArr[1])
                mmVals.append(lineArr[2])
            }
        } catch let err as NSError {
            print(err.localizedDescription)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fracVals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("fracCell", forIndexPath: indexPath) as! FracChartCell
        cell.frac.text=fracVals[indexPath.row]
        cell.decimal.text=decVals[indexPath.row]
        cell.mm.text=mmVals[indexPath.row]
        return cell
    }
}

class FracChartCell:UITableViewCell{
    @IBOutlet weak var frac:UILabel!
    @IBOutlet var decimal:UILabel!
    @IBOutlet var mm:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
