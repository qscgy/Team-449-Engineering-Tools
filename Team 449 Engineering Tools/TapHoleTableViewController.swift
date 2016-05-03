//
//  TapHoleTableViewController.swift
//  Team 449 Engineering Tools
//
//  Created by Sam Ehrenstein on 5/1/16.
//  Copyright © 2016 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit

class TapHoleTableViewController: UITableViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var screwVals=[String]()
    var odVals=[String]()
    var tapSizeVals=[String]()
    var tapDecVals=[String]()
    var cfSizeVals=[String]()
    var cfDecVals=[String]()
    var ffSizeVals=[String]()
    var ffDecVals=[String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle=NSBundle.mainBundle()
        let path=bundle.pathForResource("tapchart", ofType: "csv")
        do {
            let content=try String(contentsOfFile: path!)
            let data=content.componentsSeparatedByString("\n")
            for line in data{
                let lineArr=line.componentsSeparatedByString(",")
                screwVals.append(lineArr[0])
                odVals.append(lineArr[1])
                tapSizeVals.append(lineArr[2])
                tapDecVals.append(lineArr[3])
                cfSizeVals.append(lineArr[4])
                cfDecVals.append(lineArr[5])
                ffSizeVals.append(lineArr[6])
                ffDecVals.append(lineArr[7])
            }
        } catch let err as NSError {
            print(err.localizedDescription)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return screwVals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tapCell", forIndexPath: indexPath) as! TapHoleCell
        /*
        cell.screw.label.text=screwVals[indexPath.row]
        cell.od.label.text=odVals[indexPath.row]
        cell.tapSize.label.text=tapSizeVals[indexPath.row]
        cell.tapDec.label.text=tapDecVals[indexPath.row]
        cell.cfSize.label.text=cfSizeVals[indexPath.row]
        cell.cfDec.label.text=cfDecVals[indexPath.row]
        cell.ffSize.label.text=ffSizeVals[indexPath.row]
        cell.ffDec.label.text=ffDecVals[indexPath.row]
    */

        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let thCell=cell as? TapHoleCell else {return}
        thCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
    
    //sets up each cell in the collection view
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor=UIColor.whiteColor()
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier("thData", forIndexPath: indexPath) as! TapHoleDataCell
        cell.backgroundColor=UIColor.whiteColor()
        
        var list:[String]
        
        switch(indexPath.item){
        case 0:
           list=screwVals
            break
        case 1:
            list=odVals
            break
        case 2:
            list=tapSizeVals
            break
        case 3:
            list=tapDecVals
            break
        case 4:
            list=cfSizeVals
            break
        case 5:
            list=cfDecVals
            break
        case 6:
            list=ffSizeVals
            break
        default:
            list=ffDecVals
            break
        }
        cell.label.text=list[collectionView.tag]
        
        //print(screwVals[collectionView.tag]+" \(collectionView.tag)")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class TapHoleCell:UITableViewCell{
    /*
    @IBOutlet var screw:TapHoleDataCell!
    @IBOutlet var od:TapHoleDataCell!
    @IBOutlet var tapSize:TapHoleDataCell!
    @IBOutlet var tapDec:TapHoleDataCell!
    @IBOutlet var cfSize:TapHoleDataCell!
    @IBOutlet var cfDec:TapHoleDataCell!
    @IBOutlet var ffSize:TapHoleDataCell!
    @IBOutlet var ffDec:TapHoleDataCell!
    */
    
    @IBOutlet var collectionView:UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCollectionViewDataSourceDelegate<D:protocol<UICollectionViewDataSource,UICollectionViewDelegate>>(dataSourceDelegate:D, forRow:Int){
        collectionView.delegate=dataSourceDelegate
        collectionView.dataSource=dataSourceDelegate
        collectionView.tag=forRow
        collectionView.reloadData()
    }
}

class TapHoleDataCell:UICollectionViewCell{
    @IBOutlet var label:UILabel!
}





