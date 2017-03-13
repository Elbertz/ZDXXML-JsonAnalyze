//
//  SBJsonEngine.m
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/11.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import "SBJsonEngine.h"
#import "SBJson.h"

@implementation SBJsonEngine

static id SBJsonClass;
+ (id)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SBJsonClass = [[SBJsonEngine alloc]init];
    });
    
    return SBJsonClass;
}

- (void)startSBJsonAnalyzeWithData:(NSData *)data{
    SBJsonParser *parser = [[SBJsonParser alloc]init];
    NSDictionary *dic = [parser objectWithData:data];
    
    NSLog(@"dic = %@",dic);
    
}

@end
