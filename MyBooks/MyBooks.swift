//
//  MyBooks.swift
//  MyBooks
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class MyBooks: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var type: String!
    let booksPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    let booksHTML = [
        ("Lập trình iOS Objective-C")
    ]
    let booksDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        type = self.tabBarItem.title
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count: Int!
        switch (type)
        {
        case "PDF": count = booksPDF.count
        case "HTML": count = booksHTML.count
        case "DOCX": count = booksDocx.count
        default: break
        }
        return count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BookCell
        var thumbImg: UIImage!
        var nameLabel: String!
        
        switch type {
        case "PDF": thumbImg = UIImage(named: "\(booksPDF[indexPath.row]).jpg")

        nameLabel = booksPDF[indexPath.row]
        case "DOCX": thumbImg = UIImage(named: "\(booksDocx[indexPath.row]).jpg")
        nameLabel = booksDocx[indexPath.row]
        case "HTML": thumbImg = UIImage(named: "\(booksHTML[indexPath.row]).jpg")
        nameLabel = booksHTML[indexPath.row]
        default: break
        }
        cell.addSubViews()
        cell.imageView.image = thumbImg!
        cell.nameLabel.text = nameLabel!
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("Detail") as! DetailViewController
        
        var urlString: String!
        switch (type) {
        case "PDF": urlString = booksPDF[indexPath.row]
        case "DOCX": urlString = booksDocx[indexPath.row]
        case "HTML": urlString = booksHTML[indexPath.row]
        default: break
        }
        detailVC.urlString = urlString
        detailVC.type = self.tabBarItem.title!

        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
