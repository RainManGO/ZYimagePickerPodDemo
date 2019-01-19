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

    //布局的工具，可选安装
    @IBOutlet weak var imagePickerView: ZYImagePickerLayoutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //主题颜色
        ZYPhotoAlbumSkinColor = UIColor.orange
        //加号回调
        imagePickerView.addCallBack = { () in
            self.goPickerController()
        }
    }
    
    @IBAction func selectPhotoBtnClick(_ sender: UIButton) {
        goPickerController()
    }

    //选择照片回调方法
    func photoAlbum(selectPhotos: [ZYPhotoModel]) {
        let imageArray = selectPhotos.map { (model) -> UIImage in
            return model.thumbnailImage!
        }
        //选择的照片之后去layout显示
        imagePickerView.dataSource = imageArray
        imagePickerView.numberOfLine = 4
        imagePickerView.reloadView()
        //点击照片选择回调
        imagePickerView.tapCellCallBack = { (index) in
            let vc = self.previewPhoto(index: index, images: selectPhotos)
            //如果在外面进入预览，必须用modal的方式
            self.present(vc, animated: true, completion: nil)
        }
        //删除照片回调
        imagePickerView.deletePhotoCallBack = { (index) in
            print(index)
        }

    }
    
    func  goPickerController() {
        let photoAlbumVC = ZYPhotoNavigationViewController(photoAlbumDelegate: self, photoAlbumType: .selectPhoto)    //初始化需要设置代理对象
        photoAlbumVC.maxSelectCount = 9   //最大可选择张数
        self.navigationController?.present(photoAlbumVC, animated: true, completion: nil)
    }

    //照片浏览
    func previewPhoto(index:Int,images:[ZYPhotoModel]) -> UIViewController{
        let photoPreviewVC = ZYPhotoPreviewDeleteViewController()
        photoPreviewVC.previewPhotoArray = images       //传入预览源，为WQPhotoModel数组，支持缩略图，原图和网络图
        photoPreviewVC.currentIndex = index                    //当前展示第几张
        photoPreviewVC.isAllowDelete = false
        return photoPreviewVC
    }
}



