//
//  SecondViewController.swift
//  TableCollectionView
//
//  Created by 澤井聖也 on 2015/09/26.
//  Copyright (c) 2015年 澤井聖也. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postlabel: UILabel!
    var selectedImg: UIImage!
    var selectedMentor:String!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//   
//        let nowIndexPathDictionary:(AnyObject) = wholeArray[indexPath.row]
//
//        
//        postImageView.image = UIImage(named: nowIndexPathDictionary["picture"] as! String)
//        postlabel.text = nowIndexPathDictionary["name"] as? String
//    
//        
        
        postlabel.text = selectedMentor
        postImageView.image = selectedImg
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
