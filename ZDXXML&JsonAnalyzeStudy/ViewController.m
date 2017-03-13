//
//  ViewController.m
//  ZDXXML&JsonAnalyzeStudy
//
//  Created by Elbert on 17/3/8.
//  Copyright © 2017年 Elbert. All rights reserved.
//

#import "ViewController.h"
#import "sysXMLEngine.h"
#import "XMLDictionary.h"
#import "GDataXMLNode.h"
#import "SysJsonAnalyzeEngine.h"
#import "SBJsonEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    
//    [self testXMLToDic];
    
    //[self testSysXMLAnalyze];
    
//    [self testGDataXMLAnalyze];
    
//    [self testSysJsonAnalyze];
    
    [self testSBJsonAnalyze];
    
    
}

- (void)testXMLToDic{
    NSString *XMLPath = [[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"config2.xml" isDirectory:YES].path;
    
    NSURL *url = [NSURL fileURLWithPath:XMLPath];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSLog(@"data = %@", data);
    
    NSDictionary *dic = [NSDictionary dictionaryWithXMLFile:XMLPath];
    NSLog(@"dic = %@",dic);
    
}

-(void)testSysXMLAnalyze{
    NSString *XMLPath = [[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"config2.xml" isDirectory:YES].path;
    
    NSURL *url = [NSURL fileURLWithPath:XMLPath];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSLog(@"data = %@", data);
    
    [[sysXMLEngine shareInstance] startXMLAnalyzeWithData:data];
}

-(void)testGDataXMLAnalyze{
    NSString *XMLPath = [[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"config.xml" isDirectory:YES].path;
    NSLog(@"XMLPath=%@",XMLPath);
    
    NSURL *url = [NSURL fileURLWithPath:XMLPath];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSLog(@"data = %@", data);
    
    //1.首先根据XML数据生成XMLDocument对象，这个对象
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    NSLog(@"document = %@", document);
    
    //获取根节点
    GDataXMLElement *rootElement = [document rootElement];
    NSLog(@"rootElement = %@", rootElement);
    
    //获取其他节点
    NSArray *list = [rootElement elementsForName:@"List"];
    NSLog(@"list = %@", list);
    
    
    for (GDataXMLElement *obj in list) {
        NSArray *items = [obj elementsForName:@"Item"];
        NSLog(@"items = %@", items);
        
        for (GDataXMLElement *obj in items) {
            NSString *name = [[obj attributeForName:@"name"] stringValue];
            NSString *value = [[obj attributeForName:@"value"] stringValue];
            
            NSLog(@"name=%@--value=%@",name,value);
        }
    }
    
    
}

-(void)testSysJsonAnalyze{
    NSString *jsonPath = [[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"ZDXDirections.geojson" isDirectory:YES].path;
    NSLog(@"jsonPath=%@",jsonPath);
    
    NSFileManager * manger = [NSFileManager defaultManager];
    
    BOOL ll = [manger fileExistsAtPath:jsonPath];
    if (ll) {
        NSLog(@"jsonPath=11111111111");
    } else {
        NSLog(@"jsonPath=22222222222");
    }
    
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"ZDXDirections" ofType:@"geojson"];
    NSString *ff = [[NSString alloc] initWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"strPath=%@--ff=%@",strPath,ff);
    
    //NSURL *url = [NSURL fileURLWithPath:ff];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSLog(@"data=%@",data);
    
    [[SysJsonAnalyzeEngine shareInstance] startJsonAnalyzeWithData:data];
}

-(void)testSBJsonAnalyze{
    NSString *jsonPath = [[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"ZDXDirections.geojson" isDirectory:YES].path;
    NSLog(@"jsonPath=%@",jsonPath);
    
    NSData *data = [NSData dataWithContentsOfFile:jsonPath options:NSDataReadingMappedAlways error:nil];
    NSLog(@"data=%@",data);
    
    [[SBJsonEngine shareInstance] startSBJsonAnalyzeWithData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
