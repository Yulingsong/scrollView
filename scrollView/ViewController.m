//
//  ViewController.m
//  scrollView
//
//  Created by yulingsong on 16/6/14.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ace"]];
    
    [self.scrollView addSubview:imageView];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    //设置内容大小
    self.scrollView.contentSize = imageView.image.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)left:(id)sender
{
    //偏移量,记录UIScrollView 滚动的位置，有多少内容已经超出左上角
    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.scrollView.contentOffset = CGPointMake(0 , self.scrollView.contentOffset.y);
//    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset = CGPointMake(0 , self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        NSLog(@"执行完毕最左");
    }];
    
    //打印偏移量
    NSLog(@"---%@",NSStringFromCGPoint(self.scrollView.contentOffset));
}

- (IBAction)top:(id)sender
{
//    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x , 0);
    CGPoint offset = CGPointMake(self.scrollView.contentOffset.x , 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (IBAction)bottom:(id)sender
{
    CGFloat offsetY = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x , offsetY);
}

- (IBAction)right:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
//    [UIView setAnimationDelegate:self];//代理
//    [UIView setAnimationDidStopSelector:@selector(stop)];
//    [UIView setAnimationWillStartSelector:@selector(start)];
    
    CGFloat offsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(offsetX , self.scrollView.contentOffset.y);
    [UIView commitAnimations];
}

-(void)start
{
    NSLog(@"start");
}
-(void)stop
{
    NSLog(@"stop");
    
}
@end
