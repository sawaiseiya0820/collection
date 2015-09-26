//
//  ViewController.swift
//  TableCollectionView
//
//  Created by 澤井聖也 on 2015/09/26.
//  Copyright (c) 2015年 澤井聖也. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var wholeArray = [AnyObject]()
    
    let funaminDictionary = ["name":"ふなみん","picture":"photo1.jpg"]
    let shinokinDictionary = ["name":"しのきん","picture":"photo2.jpg"]
    let chamaDictionary = ["name":"ちゃま","picture":"photo3.jpg"]
    let carlDictionary = ["name":"カール","picture":"photo4.jpg"]
    let gucchiDictionary = ["name":"ぐっち","picture":"photo5.jpg"]
    let daifukuDictionary = ["name":"だいふく","picture":"photo6.jpg"]
    let sinchanDictionary = ["name":"しんちゃん","picture":"photo7.jpg"]
    let sakinchoDictionary = ["name":"さきんちょ","picture":"photo8.jpg"]
    let kasuminDictionary = ["name":"かすみん","picture":"photo9.jpg"]
    let eguchiDictionary = ["name":"えぐち","picture":"photo10.jpg"]
    let ferioDictionary = ["name":"ふぇりお","picture":"photo11.jpg"]
    let yukimiDictionary = ["name":"ゆきみ","picture":"photo12.jpg"]
    let inocchiDictionary = ["name":"いのっち","picture":"photo13.jpg"]
    let nukkiDictionary = ["name":"ぬっき","picture":"photo14.jpg"]
    let gamiDictionary = ["name":"ガミ","picture":"photo15.jpg"]
    let anotherDictionary = ["name":"アナザー","picture":"photo16.jpg"]
    let theanoDictionary = ["name":"ざーあな","picture":"photo17.jpg"]
    let suitsDictionary = ["name":"スーツ","picture":"photo18.jpg"]
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedImage:UIImage?
    var selectedString:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wholeArray = []
        
        if saveData.objectForKey("nameArray") != nil {
            wholeArray = saveData.objectForKey("nameArray") as! Array
        }else{
            wholeArray = [funaminDictionary,shinokinDictionary,chamaDictionary,carlDictionary,gucchiDictionary,daifukuDictionary,sinchanDictionary,sakinchoDictionary,kasuminDictionary,eguchiDictionary,ferioDictionary,yukimiDictionary,inocchiDictionary,nukkiDictionary,gamiDictionary,anotherDictionary,theanoDictionary,suitsDictionary]
        }
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wholeArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        let nowIndexPathDictionary:(AnyObject) = wholeArray[indexPath.row]
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: nowIndexPathDictionary["picture"] as! String)
        //        imageView.image = UIImage(named: "photo.jpg")
        
        
        let label = cell.viewWithTag(2) as! UILabel
        label.text = nowIndexPathDictionary["name"] as? String
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedImage = UIImage(named: wholeArray[indexPath.row]["picture"] as! String!)
        selectedString = wholeArray[indexPath.row]["name"] as? String
        self.performSegueWithIdentifier("next", sender: nil)
        
    }
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "next") {
            let secondVC: SecondViewController = (segue.destinationViewController as? SecondViewController)!
            secondVC.selectedImg = selectedImage
            secondVC.selectedMentor = selectedString
        }
    }
    
}

