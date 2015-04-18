//
//  MesureViewController.swift
//  InteglassApp
//
//  Created by YotaOdaka on 2015/04/14.
//  Copyright (c) 2015年 YotaOdaka. All rights reserved.
//

import UIKit
import CoreGraphics

class MesureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UIGraphicsBeginImageContext(CGSizeMake(300, 300))
        //1.グラフィックスコンテキストを取得
        let context:CGContextRef = UIGraphicsGetCurrentContext()
        
        //2.描画用の設定（図形の線の太さを設定）
        CGContextSetLineWidth(context, 2.0)
        //2.描画用の設定（図形の線の色を設定）
        let color:CGColorRef = UIColor.redColor().CGColor
        CGContextSetStrokeColorWithColor(context, color)
        
        //3.パスを作成
        CGContextMoveToPoint(context, 50, 50)
        CGContextAddLineToPoint(context, 250, 250)
        
        //4.パスを閉じる
        CGContextClosePath(context)
        //4.パスで指定した図形を描画
        CGContextStrokePath(context)
        
        //5.UIImageの取得
        let img:CGImageRef = CGBitmapContextCreateImage(context)
        imageView.image = UIImage(CGImage: img)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //define method to return to here from next view
    @IBAction func returnToRecipeMeasure(segue: UIStoryboardSegue){
        
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
