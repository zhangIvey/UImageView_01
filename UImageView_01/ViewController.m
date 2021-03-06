//
//  ViewController.m
//  UImageView_01
//
//  Created by yaoln on 16/9/21.
//  Copyright © 2016年 zhangze. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//图片序列
@property (weak, nonatomic) IBOutlet UILabel *imageOrderLabel;
//图片
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
//上一张按钮
@property (weak, nonatomic) IBOutlet UIButton *previousButton;

//下一张按钮
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

//图片描述
@property (weak, nonatomic) IBOutlet UILabel *imageDescriptionLabel;

//当前图片的索引值
@property (assign, nonatomic) int currentIndex;

//存放字典类型的集合
@property (strong, nonatomic) NSArray *imagesArray;


- (IBAction)nextButtonClick:(id)sender;

- (IBAction)previousButtonClick:(id)sender;

@end

#define ImageName @"imageName"
#define Description @"Description"

@implementation ViewController


#pragma mark - 运行周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //首张图片的初始化
    [self nextButtonClick:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//懒加载，延迟加载 : 对get方法的重写
- (NSArray *)imagesArray{
    if (_imagesArray == nil) {
        
        /*第一种赋值方式 ：字典类型的赋值
        NSDictionary *dic1 = @{ImageName:@"2",Description:@"第一张图片描述"};
        NSDictionary *dic2 = @{ImageName:@"3",Description:@"第二张图片描述"};
        NSDictionary *dic3 = @{ImageName:@"4",Description:@"第三张图片描述"};
        NSDictionary *dic4 = @{ImageName:@"5",Description:@"第四张图片描述"};
        
        NSArray *array = @[dic1, dic2, dic3, dic4];
        _imagesArray = array;
         */
        
        /*
         *第二种赋值方式 ： plist文件的赋值方式 NSBundle
         */
        //1 : plist文件的获取方式 path
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"imagesData" ofType:@"plist"];
//        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        
        //2 : plist文件的获取方式 url
        
        // url 获取文件方式A
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"imagesData" ofType:@"plist"];
//        NSURL *url = [NSURL fileURLWithPath:filePath];
        // url 获取文件方式B
        /*
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"imagesData" ofType:@"plist"];
        //需要添加URL头
        NSString *urlPath = [NSString stringWithFormat:@"file://%@",filePath];
        NSURL *url = [NSURL URLWithString:urlPath];
        NSArray *array = [NSArray arrayWithContentsOfURL:url];
        
        _imagesArray = array;
        */
        //通过model的形式进行封装赋值
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"imagesData" ofType:@"plist"];
        //需要添加URL头
        NSString *urlPath = [NSString stringWithFormat:@"file://%@",filePath];
        NSURL *url = [NSURL URLWithString:urlPath];
        NSArray *array = [NSArray arrayWithContentsOfURL:url];
        
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            ImageModel *model = [ImageModel imageModel:dic];
            [modelArray addObject:model];
        }
        _imagesArray = modelArray;
    }
    return _imagesArray;
}


/**
 *Function ：切换展示的图片
 *Parameter：
 *Return   ：
 *From     ：
 *Version  ：
 */
- (void)changImageView
{
    
    /* 第一种方式
    switch (self.currentIndex) {
        case 1:
            self.imageOrderLabel.text = @"1/4";
            self.imageview.image = [UIImage imageNamed:@"2"];
            self.imageDescriptionLabel.text = @"第一张图片的描述";
            break;
        case 2:
            self.imageOrderLabel.text = @"2/4";
            self.imageview.image = [UIImage imageNamed:@"3"];
            self.imageDescriptionLabel.text = @"第二张图片的描述";
            break;
            
        case 3:
            self.imageOrderLabel.text = @"3/4";
            self.imageview.image = [UIImage imageNamed:@"4"];
            self.imageDescriptionLabel.text = @"第三张图片的描述";
            break;
            
        case 4:
            self.imageOrderLabel.text = @"4/4";
            self.imageview.image = [UIImage imageNamed:@"5"];
            self.imageDescriptionLabel.text = @"第四张图片的描述";
            break;
            
        default:
            break;
    }
    
    self.nextButton.enabled = self.currentIndex != 4;
    self.previousButton.enabled = self.currentIndex != 1;

     */
    
    /*
     第二种方式：使用字典类型来实现图片的加载
     */
    /*
    self.imageOrderLabel.text = [NSString stringWithFormat:@"%d/%ld",self.currentIndex,self.imagesArray.count];
    NSDictionary *tempDic = [self.imagesArray objectAtIndex:self.currentIndex-1];
    
    
#pragma mark  图片加载的知识点
    //=================
    //1 :[UIImage imageNamed]这种方式会有缓存，讲所有的图片加载到内存中；
    self.imageview.image = [UIImage imageNamed:tempDic[ImageName]];
    
    //2 :NSbundle的形式图片，没有文件夹的形式；
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"jpg"];
//    self.imageview.image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    
    //3 :NSbundle的形式图片，有文件夹的形式；
//    NSString *imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/singleimage/8.jpg"];
//    self.imageview.image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    self.imageDescriptionLabel.text = tempDic[Description];
    */
    
    
    //=================
    
    ImageModel *model = self.imagesArray[self.currentIndex - 1];
    
    self.imageOrderLabel.text = [NSString stringWithFormat:@"%d/%ld",self.currentIndex,self.imagesArray.count];
    self.imageview.image = [UIImage imageNamed:model.imageName];
    self.imageDescriptionLabel.text = model.imageDescription;
    
    
    self.nextButton.enabled = self.currentIndex != self.imagesArray.count;
    self.previousButton.enabled = self.currentIndex != 1;
    
    
}

/**
 *Function ：“下一张”按钮的点击事件
 *Parameter：
 *Return   ：
 *From     ：
 *Version  ：
 */
- (IBAction)nextButtonClick:(id)sender {
    self.currentIndex ++;
    [self changImageView];
}
/**
 *Function ：“上一张”按钮的点击事件
 *Parameter：
 *Return   ：
 *From     ：
 *Version  ：
 */
- (IBAction)previousButtonClick:(id)sender {
    self.currentIndex --;
    [self changImageView];
}
@end
