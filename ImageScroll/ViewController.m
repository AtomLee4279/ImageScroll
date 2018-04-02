//
//  ViewController.m
//  ImageScroll
//
//  Created by 李一贤 on 2018/4/2.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ImageScroll;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat imageViewY = 0;
    CGFloat imageViewH = self.ImageScroll.frame.size.height;
    CGFloat imageViewW = self.ImageScroll.frame.size.width;
    for(int i =0;i<3;i++)
    {
        //1.1创建一个图片对象
        UIImageView* imageView = [[UIImageView alloc]init];
        //1.2设置frame
        CGFloat imageViewX = i*imageViewW;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        //1.3添加
        [self.ImageScroll insertSubview:imageView atIndex:0];
        //1.4设置imageView的图片
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
    }
    //设置滚动范围
    self.ImageScroll.contentSize = CGSizeMake(imageViewW*3, 0);
    self.ImageScroll.pagingEnabled = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//调用结束拖拽的方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"结束拖拽");
    
    
}

@end
