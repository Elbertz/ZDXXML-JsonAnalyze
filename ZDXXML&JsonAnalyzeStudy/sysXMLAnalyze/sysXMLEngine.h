//
//  sysXMLEngine.h
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/9.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sysXMLEngine : NSObject<NSXMLParserDelegate>

//添加属性
@property (nonatomic, strong) NSXMLParser *par;
//存放每个person
@property (nonatomic, strong) NSMutableArray *list;
//标记当前标签，以索引找到XML文件内容
@property (nonatomic, copy) NSString *currentElement;

+(id)shareInstance;

- (void)startXMLAnalyzeWithData:(NSData *)data;

@end
