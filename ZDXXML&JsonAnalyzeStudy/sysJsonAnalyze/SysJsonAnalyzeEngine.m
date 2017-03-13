//
//  SysJsonAnalyzeEngine.m
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/10.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import "SysJsonAnalyzeEngine.h"

@implementation SysJsonAnalyzeEngine

static id sysJson;
+ (id)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sysJson = [[SysJsonAnalyzeEngine alloc]init];
    });
    
    return sysJson;
}

- (void)startJsonAnalyzeWithData:(NSData *)data{
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"resultDic=%@",resultDic);
}

@end
