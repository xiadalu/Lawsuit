//
//  UIImage+Scale.h
//  LawServer
//
//  Created by xiadalu on 2016/9/27.
//  Copyright © 2016年 夏大路. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)


-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;
//将颜色转换成图片
+(UIImage*)createImageWithColor:(UIColor*)color;


+(UIImage *)fixOrientation:(UIImage *)aImage;

@end
