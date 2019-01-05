//
//  ImagePickerLayoutCollectionViewCell.swift
//  ZYImagePickerAndBrower
//
//  Created by Nvr on 2018/8/20.
//  Copyright © 2018年 ZY. All rights reserved.
//

import UIKit

class ImagePickerLayoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var deleteCallBack:CallBack?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deteBtnClick(_ sender: UIButton) {
        deleteCallBack!()
    }
}
