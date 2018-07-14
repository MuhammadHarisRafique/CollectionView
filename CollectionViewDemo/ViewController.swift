//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Higher Visibility on 13/07/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionview: UICollectionView!
    
   
    var arrayOne = ["10","28","12","5","7","10","28","12","5","7","10","28","12","5","7","10"]
    
    var arrayTwo = ["28","12","5","7","10","28","12","5","7","10","28","12","5","7"]
    
    var section = ["NumberOne","NUmberTwo"]
    
    var combinedArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let edge:CGFloat = 8.0
        let itemsize = (self.collectionview.frame.width / 4) - 8
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        self.collectionview.collectionViewLayout = layout
        self.combinedArray = NSMutableArray(array: [self.arrayOne,self.arrayTwo])
        
    }
  

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.collectionview.frame.width, height: 50)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headercell", for: indexPath) as? CollectionReusableView
        headerCell?.lblHeader.text = self.section[indexPath.row]
        return headerCell!
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.section.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let arr = self.combinedArray[section] as! NSArray
        return arr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionview", for: indexPath) as? CollectionViewCell
        
        let arr = self.combinedArray[indexPath.section] as! NSArray
        cell?.textlabel.text = arr[indexPath.row] as? String
        
        return cell!
    
    }
    


}

