//
//  NextStepModel.h
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NextStepModel : NSObject


@property(nonatomic,copy)NSString* title;

@property(nonatomic,assign)BOOL state;

@property(nonatomic,strong)NSMutableArray* commentModels;

@end
