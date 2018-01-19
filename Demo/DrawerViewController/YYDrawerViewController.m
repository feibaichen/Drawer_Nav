//
//  YYDrawerViewController.m
//  简单地抽屉效果
//
//  Created by Yang on 15/10/4.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import "YYDrawerViewController.h"
#define RandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface YYDrawerViewController ()

@end

@implementation YYDrawerViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // 添加子控件
    [self setUpAllChildView];
    // 添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    // 把手势添加到主视图上
    [_mainView addGestureRecognizer:pan];
    
    // 添加点击手势
   // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    //[self.view addGestureRecognizer:tap];
}

- (void)tap
{
    // 点击控制器的view就会回到mainView
    if (_mainView.frame.origin.x != 0) {
        [UIView animateWithDuration:0.5 animations:^{
            
            _mainView.frame = self.view.bounds;
            
        }];
    }
}



#define targetR 300
#define targetL -250

// pan手势
- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 随着手指移动而移动
    // 获取x轴偏移量
    CGFloat offsetX = [pan translationInView:_mainView].x;
    // 修改_mainView的frame
    _mainView.frame = [self frameWithOffsetX:offsetX];
    self.tabBarController.tabBar.frame=CGRectMake([self frameWithOffsetX:offsetX].origin.x,_mainView.frame.size.height-49 , _mainView.frame.size.width, 49);
    // 复位
    [pan setTranslation:CGPointZero inView:_mainView];
    [pan setTranslation:CGPointZero inView:self.tabBarController.tabBar];

    
    // 往什么方向移动
    [self moveDirection];
    
    
    
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        if (_mainView.frame.origin.x > screenW * 0.5) {
            target = targetR;
            
            
            
        }else if (CGRectGetMaxX(_mainView.frame) < screenW * 0.5)
        {
            target = targetL;
            
            
        }else{
        
            
            
//            [UIView animateWithDuration:0.3 animations:^{
//                
//                //self.tabBarController.tabBar.hidden=NO;
//                self.tabBarController.tabBar.hidden=NO;
//            }];
        }
        
        CGFloat offsetx = target - _mainView.frame.origin.x;

        
        
        [UIView animateWithDuration:0.5 animations:^{
            _mainView.frame = [self frameWithOffsetX:offsetx];
            
    
            self.tabBarController.tabBar.frame=CGRectMake([self frameWithOffsetX:offsetX].origin.x,_mainView.frame.origin.y+_mainView.frame.size.height-49 , [self frameWithOffsetX:offsetX].size.width, 49);
            
        }];
        
        
    }
    
}

// 判断往什么方向移动
- (void)moveDirection
{
    if (_mainView.frame.origin.x > 0) {
        // 往右边移动，显示左边
        _rightView.hidden = YES;
        //self.tabBarController.tabBar.hidden=YES;
        
//        [UIView animateWithDuration:0.3 animations:^{
//            
//            //self.tabBarController.tabBar.hidden=NO;
//            self.tabBarController.tabBar.hidden=YES;
//        }];
        
    }else if (_mainView.frame.origin.x < 0)
    {
        // 往左边移动，显示右边
        _rightView.hidden = NO;
        
//        [UIView animateWithDuration:0.3 animations:^{
//            
//            //self.tabBarController.tabBar.hidden=NO;
//            self.tabBarController.tabBar.hidden=YES;
//        }];
    }
    
    //self.tabBarController.tabBar.hidden=YES;
}

// 计算当前_mainView最新的frame
- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    
    //这种方式类似于QQ的侧滑====
    CGRect frame = _mainView.frame;
    
    CGFloat x = frame.origin.x += offsetX;
    CGFloat y = 0;
    CGFloat h = screenH;
    CGFloat w = screenW ;
    
    return CGRectMake(x, y, w, h);
    
    //这种方式类似于QQ的侧滑====
    
    
    
    //用这里可以缩放，类似酷狗音乐======
    
//    CGRect frame = _mainView.frame;
//    
//    CGFloat x = frame.origin.x += offsetX;
//    CGFloat y = fabs(x / screenW * 100);
//    CGFloat h = screenH - 2 * y;
//    CGFloat scale = h / screenH;
//    CGFloat w = screenW * scale;
//    
//    return CGRectMake(x, y, w, h);
    
    //用这里可以缩放，类似酷狗音乐======
}


// 添加子控件
- (void)setUpAllChildView
{
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.bounds];
    // 赋值
    _leftView = leftV;
    //leftV.backgroundColor = RandomColor;
    leftV.backgroundColor = [UIColor redColor];
    [self.view addSubview:leftV];
    
    UIView *rightV = [[UIView alloc] initWithFrame:self.view.bounds];
    // 赋值
    _rightView = rightV;
   // rightV.backgroundColor = RandomColor;
    rightV.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:rightV];
    
    UIView *mainV = [[UIView alloc] initWithFrame:self.view.bounds];
    // 赋值
    _mainView = mainV;
    //mainV.backgroundColor = RandomColor;
    mainV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:mainV];
}

@end
