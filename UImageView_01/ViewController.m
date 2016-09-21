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


- (IBAction)nextButtonClick:(id)sender;

- (IBAction)previousButtonClick:(id)sender;

@end

@implementation ViewController

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

/**
 *Function ：切换展示的图片
 *Parameter：
 *Return   ：
 *From     ：
 *Version  ：
 */
- (void)changImageView
{
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
