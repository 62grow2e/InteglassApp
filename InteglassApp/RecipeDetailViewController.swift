//
//  RecipeDetailViewController.swift
//  InteglassApp
//
//  Created by YotaOdaka on 2015/04/11.
//  Copyright (c) 2015年 YotaOdaka. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDataSource, UIApplicationDelegate{
    @IBOutlet weak var ingredients: UITableView!
    var myDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    var recipeIndex:Int = -1;
    
    @IBOutlet weak var recipeTitle: UINavigationItem!
    @IBOutlet weak var recipeThumbnail: UIImageView!
    @IBOutlet weak var recipeTarget: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        var recipeObj = myDelegate.recipes[myDelegate.selectedRecipeId] as NSDictionary
        
        //recipe detail elements
        //set title
        recipeTitle.title = recipeObj["title"] as String?
        //set thumbnail
        recipeThumbnail.image  = UIImage(named: recipeObj["thumbnail"] as String!)
        //set a number of targets
        var str_target = recipeObj["target"] as NSDictionary!
        var str_target_num = String(str_target["num"] as Int)
        var str_target_unit = str_target["unit"] as String
        recipeTarget.text = str_target_num + str_target_unit
    }
    
    //return the number of row in recipe list table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var r = myDelegate.recipes[myDelegate.selectedRecipeId] as NSDictionary
        var i = r["ingredients"] as NSArray
        var n = i.count as Int
        myDelegate.num_nowIngredients = n
        return n
    }
    
    //return new cell to recipe list table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var recipeObj:NSDictionary = myDelegate.recipes[myDelegate.selectedRecipeId] as NSDictionary
        //get target cell instance
        var cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell") as UITableViewCell
        
        //get target variables in the cell
        var nameLabel = cell.viewWithTag(1) as UILabel
        var volLabel = cell.viewWithTag(2) as UILabel
        
        //ready for new variables in the cell
        
        var ingredients = recipeObj["ingredients"] as NSArray
        var ingredient = ingredients[myDelegate.nextingredientIndex] as NSDictionary
        myDelegate.nextingredientIndex = ingredient["id"] as Int + 1
        var i_name = ingredient["name"] as String!
        var i_num:Int = ingredient["num"] as Int!
        var i_order:Bool = ingredient["unitorder"] as Bool!
        
        var i_num_str = ""
        if i_num > 0 {
            i_num_str = String(i_num)
        }
        
        var i_unit = ingredient["unit"] as String!
        
        nameLabel.text = i_name
        
        if i_order {
            volLabel.text = i_num_str + i_unit
        }
        else{
            volLabel.text = i_unit + i_num_str
        }
        //var i_
        //nameLabel.text = i_name
        
        //volLabel.text = myDelegate.recipes[myDelegate.selectedRecipeId]["ingredients"][indexPath.row]["num"] as String?
        
        if myDelegate.nextingredientIndex == ingredients.count{
            myDelegate.nextingredientIndex = 0
            
        }
        return cell
        
    }
    
    //return the height of a cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40.0
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)->Void{
    
    }
    
    //define method to return to here from next view
    @IBAction func returnToRecipeLDetail(segue: UIStoryboardSegue){
        
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
