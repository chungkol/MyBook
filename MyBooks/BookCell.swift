//
//  BookCell.swift
//  MyBooks
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {

    var nameLabel: UILabel!
    var imageView: UIImageView!
    
    
    var kCellWidth: CGFloat = 120
    var kLabelHeight: CGFloat = 20
    var kImageheight: CGFloat = 180
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addSubViews(){
        if imageView == nil {
            imageView = UIImageView(frame: CGRectMake(0, 0, kCellWidth, kImageheight))
            imageView.contentMode = .ScaleAspectFill
            imageView.layer.borderColor = tintColor.CGColor
            contentView.addSubview(imageView)
        }
        if nameLabel == nil {
            nameLabel = UILabel(frame: CGRectMake(0, kImageheight, kCellWidth, kLabelHeight))
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor.blackColor()
            nameLabel.font = UIFont.systemFontOfSize(15)
            nameLabel.highlightedTextColor = tintColor
            contentView.addSubview(nameLabel)
        }
    }
    
    override var selected: Bool{
        didSet{
            imageView.layer.borderWidth = selected ? 2: 0
        }
    }


}
