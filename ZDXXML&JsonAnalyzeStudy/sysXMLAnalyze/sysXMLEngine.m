//
//  sysXMLEngine.m
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/9.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import "sysXMLEngine.h"

@implementation sysXMLEngine

@synthesize par,list,currentElement;

static id sys;
+(id)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sys = [[sysXMLEngine alloc]init];
    });
    return sys;
}

- (void)startXMLAnalyzeWithData:(NSData *)data{
    self.par = [[NSXMLParser alloc]initWithData:data];
    self.par.delegate = self;
    
    //初始化数组，存放解析后的数据
    self.list = [NSMutableArray array];
    
    [self.par parse];
}

#pragma - NSXMLParserDelegate - 
//几个代理方法的实现，是按逻辑上的顺序排列的，但实际调用过程中中间三个可能因为循环等问题乱掉顺序
//开始解析
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidStartDocument...");
}
//准备节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    
    self.currentElement = elementName;
    NSLog(@"elementName=%@",elementName);
    NSLog(@"namespaceURI=%@",namespaceURI);
    NSLog(@"qName=%@",qName);
    NSLog(@"attributeDict=%@",attributeDict);
    
    //    if ([self.currentElement isEqualToString:@"student"]){
    //        self.person = [[person alloc]init];
    //
    //    }
    
}
//获取节点内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    //    if ([self.currentElement isEqualToString:@"name"]) {
    
    NSLog(@"string = %@",string);
    //    }
    //    else if ([self.currentElement isEqualToString:@"name"]){
    //        [self.person setName:string];
    //    }else if ([self.currentElement isEqualToString:@"sex"]){
    //        [self.person setSex:string];
    //    }else if ([self.currentElement isEqualToString:@"age"]){
    //
    //        [self.person setAge:string];
    //    }
}

//解析完一个节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    
    //    if ([elementName isEqualToString:@"student"]) {
    //        [self.list addObject:self.person];
    //    }
    //    self.currentElement = nil;
}

//解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"parserDidEndDocument...");
}

@end
