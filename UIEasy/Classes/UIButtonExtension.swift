//
//  UIButtonExtension.swift
//  UIExtension
//
//  Created by kled on 2021/10/19.
//

import UIKit


//MARK: -定义button相对label的位置
enum ButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}
 
extension UIButton {
    
    func draWith(style: ButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
 
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .Top:
            //上 左 下 右
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - imageTitleSpace / 2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight! - imageTitleSpace / 2.0, right: 0)
            break;
            
        case .Left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace / 2.0, bottom: 0, right: imageTitleSpace)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace / 2.0, bottom: 0, right: -imageTitleSpace / 2.0)
            break;
            
        case .Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight! - imageTitleSpace / 2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight! - imageTitleSpace / 2.0, left: -imageWidth!, bottom: 0, right: 0)
            break;
            
        case .Right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + imageTitleSpace / 2.0, bottom: 0, right: -labelWidth - imageTitleSpace / 2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth! - imageTitleSpace / 2.0, bottom: 0, right: imageWidth! + imageTitleSpace / 2.0)
            break;
            
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
