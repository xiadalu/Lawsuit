//
//  NextStepModel.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepModel.h"

@implementation NextStepModel


-(NSMutableArray*)commentModels{
    if (!_commentModels) {
        _commentModels = [[NSMutableArray alloc] init];
    }
    return _commentModels;
}

@end
