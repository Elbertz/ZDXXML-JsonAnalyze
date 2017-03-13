//
//  SBJsonEngine.h
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/11.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBJsonEngine : NSObject

+ (id)shareInstance;

- (void)startSBJsonAnalyzeWithData:(NSData *)data;

@end
