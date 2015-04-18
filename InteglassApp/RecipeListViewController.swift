//
//  ViewController.swift
//  InteglassApp
//
//  Created by YotaOdaka on 2015/04/12.
//  Copyright (c) 2015年 YotaOdaka. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var recipeTable: UITableView!
    

    //setup for using app delegate
    var myDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    //number of called this class
    var num_called = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //load and get recipe data from json
        let path:String? = NSBundle.mainBundle().pathForResource("info_recipe", ofType: "json")
        let jsondata = NSData(contentsOfFile: path!)
        let jsonItems = NSJSONSerialization.JSONObjectWithData(jsondata!, options: nil, error: nil) as NSArray
        
        myDelegate.num_recipes = jsonItems.count//get number of recipes
        
        for item in jsonItems{
            myDelegate.recipes.append(item)
        }
        
        
    }

    //return the number of row in recipe list table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myDelegate.num_recipes
    }
    
    //return new cell to recipe list table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //get target cell instance
        var cell = tableView.dequeueReusableCellWithIdentifier("recipeCell") as UITableViewCell
        
        //get target variables in the cell
        var titleLabel = cell.viewWithTag(1) as UILabel
        var explainLabel = cell.viewWithTag(2) as UILabel
        var thumbnail = cell.viewWithTag(3) as UIImageView
        
        //ready for new variables in the cell
        titleLabel.text = myDelegate.recipes[indexPath.row]["title"] as String?
        explainLabel.text = myDelegate.recipes[indexPath.row]["explain"] as String?
        thumbnail.image = UIImage(named: myDelegate.recipes[indexPath.row]["thumbnail"] as String!)
        
        return cell
        
    }
    
    //return the height of a cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)->Void{
        
    }
    
    //tie recipe list table to this controller
    //set action when to turn to next view via segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"{
            if let indexPath = recipeTable.indexPathForSelectedRow(){
                //let nextController = segue.destinationViewController as RecipeDetailViewController
                println("selected: \(indexPath.item)")
                //nextController.recipeIndex = indexPath.item as Int
                myDelegate.selectedRecipeId = indexPath.item
            }
        }
    }
    
    //define method to return to here from next view
    @IBAction func returnToRecipeList(segue: UIStoryboardSegue){
        
    }

    //hide status bar
    override func prefersStatusBarHidden()->Bool{
        return true
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


