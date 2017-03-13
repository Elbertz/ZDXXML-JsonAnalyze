//
//  SysJsonAnalyzeEngine.h
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/10.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SysJsonAnalyzeEngine : NSObject

+ (id)shareInstance;

- (void)startJsonAnalyzeWithData:(NSData *)data;

@end
