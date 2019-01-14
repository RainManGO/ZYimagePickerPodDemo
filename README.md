# ZYimagePickerPodDemo


[`ZYImagePickerAndBrower`](https://github.com/RainManGO/ZYImagePickerAndBrower) 是一个模仿微信相册多选照片的一个控件。注意了微信相册的一些细节，比如序号，最大选择之后照片变灰，浏览缩略图等等。
[`ZYImagePickerLayoutView`](https://github.com/RainManGO/ZYImagePickerLayoutView) 是相册选择之后的布局view库，单独拿出来做一个UI库，可选集成。


![image](https://github.com/RainManGO/ZYImagePickerAndBrower/blob/master/imagePickerDemo1.gif)
![image](https://github.com/RainManGO/ZYImagePickerAndBrower/blob/master/imagePickerDemo2.gif)

## Requirements

`ZYImagePickerAndBrower`   支持iOS8+

* Photo.framework
* UIKit.framework


## Adding ZYImagePickerAndBrower to your project

### CocoaPods

1. Add a pod entry for ZYImagePickerAndBrower to your Podfile `pod 'ZYImagePickerAndBrower', '~> 1.1.0'`
2. Add a pod entry for ZYImagePickerAndBrower to your Podfile `pod 'ZYImagePickerLayoutView', '~> 0.1.7'`  可选
3. Install the pod(s) by running `pod install`.


## 功能支持
==============
- **相册序号选择**: 微信样式多选照片
- **预览序号选择**: 预览时可以序号选择
- **预览缩略图和大图联动**: 联动样式仿微信
- **网络图片浏览**: 有时需要处理服务器返回网络图片
- **快速布局UI**: 只需集成 [ZYImagePickerLayoutView](https://github.com/RainManGO/ZYImagePickerLayoutView) 可自动将照片布局

## 使用

设置主题颜色

```swift 
ZYPhotoAlbumSkinColor = UIColor.orange
```

选照片

```swift 
 let photoAlbumVC = ZYPhotoNavigationViewController(photoAlbumDelegate: self, photoAlbumType: .selectPhoto)    //初始化需要设置代理对象
        photoAlbumVC.maxSelectCount = 9   //最大可选择张数
        self.navigationController?.present(photoAlbumVC, animated: true, completion: nil)
```

ZYPhotoAlbumProtocol回调

```swift 
 func photoAlbum(selectPhotos: [ZYPhotoModel]) {
        //选择的照片之后去layoutView显示
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
```

预览图片： ZYPhotoModel支持url,image预览

```swift
 let photoPreviewVC = ZYPhotoPreviewDeleteViewController()
        photoPreviewVC.previewPhotoArray = self.selectIamgeArr        //传入预览源，为ZYPhotoModel数组，支持缩略图，原图和网络图
        photoPreviewVC.currentIndex = index                    //当前展示第几张
        photoPreviewVC.isAllowDelete = false
        self.navigationController?.pushViewController(photoPreviewVC, animated: true)
```
## License


## 有问题记得issues,记得给个star，谢谢


