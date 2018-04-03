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
    //2.设置滚动范围
    self.ImageScroll.contentSize = CGSizeMake(imageViewW*3, 0);
    //3.设置分页
    self.ImageScroll.pagingEnabled = YES;
    //4.设置总的页码数
    self.pageControl.numberOfPages = 3;
    //5.设置当前页
    self.ImageScroll.delegate = self;
    //定时器：
    //1.NSTimer：可以设定时间，一般执行间隔较长时间的操作
    //2.CADisplayLink：表示刷帧，一般一秒钟执行多次方法，一般和动画配合使用（此处不适用）
    
    //6.添加定时器
    //scheduledTimerWithTimeInterval表示每个多长时间执行方法
    //selector：表示要执行的方法
    //target：表示谁来调用此方法
    //repeat：表示是否重复
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    
}

-(void) nextPage
{
    //1.记录当前页数
    NSInteger currnetPage = self.pageControl.currentPage;
    if (currnetPage==2) {
        currnetPage = 0;
    }
    else
    {
        currnetPage++;
    }
    //2.根据当前页数确定滚动范围，切页
    //self.ImageScroll.contentOffset = CGPointMake(currnetPage*self.ImageScroll.frame.size.width, 0);
    [self.ImageScroll setContentOffset:CGPointMake(currnetPage*self.ImageScroll.frame.size.width, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-（void）scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //1.获取滚动的偏移量
//    CGPoint offSet = self.ImageScroll.contentOffset;
//    CGFloat offSetX = offSet.x;
//    CGFloat scrollW = scrollView.frame.size.width;
//    self.pageControl.currentPage = offSetX/scrollW;
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    1.获取滚动的偏移量
        CGPoint offSet = self.ImageScroll.contentOffset;
        CGFloat offSetX = offSet.x;
        CGFloat scrollW = scrollView.frame.size.width;
//    2.算出页码
        int page = (offSetX+0.5*scrollW)/scrollW;//偏移量超过0.5，把它算作一页
        self.pageControl.currentPage = page;
}


@end
