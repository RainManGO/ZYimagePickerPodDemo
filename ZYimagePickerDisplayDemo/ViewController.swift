//
//  ViewController.swift
//  ZYimagePickerDisplayDemo
//
//  Created by Nvr on 2018/8/23.
//  Copyright © 2018年 ZY. All rights reserved.
//

import UIKit
import ZYImagePickerLayoutView
import ZYImagePickerAndBrower

class ViewController: UIViewController,ZYPhotoAlbumProtocol {
    
    @IBOutlet weak var imagePickerView: ZYImagePickerLayoutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ZYPhotoAlbumSkinColor = UIColor.orange
    }
    
    @IBAction func selectPhotoBtnClick(_ sender: UIButton) {
        goPickerController()
    }
    
    func photoAlbum(selectPhotos: [ZYPhotoModel]) {
        
        let imageArray = selectPhotos.map { (model) -> UIImage in
            return model.thumbnailImage!
        }
        imagePickerView.dataSource = imageArray
        imagePickerView.numberOfLine = 4
        imagePickerView.reloadView()
        imagePickerView.addCallBack = { () in
            self.goPickerController()
        }
    }
    
    func  goPickerController() {
        let photoAlbumVC = ZYPhotoNavigationViewController(photoAlbumDelegate: self, photoAlbumType: .selectPhoto)    //初始化需要设置代理对象
        photoAlbumVC.maxSelectCount = 9   //最大可选择张数
        self.navigationController?.present(photoAlbumVC, animated: true, completion: nil)
    }
}



