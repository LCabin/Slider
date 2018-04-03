//
//  SlideViewController.m
//  SunSoft
//
//  Created by 田司 on 2018/3/7.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "SlideViewController.h"
#import "NHGraphCoder.h"
#import "SvUDIDTools.h"
@interface SlideViewController ()<CustomNavViewDelegate>
{
  UIButton *leftBtn;
  UILabel *titleLab;
  CustomNav *navView;
}
@end

@implementation SlideViewController
-(UIStatusBarStyle)preferredStatusBarStyle{
  return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
  [super viewDidLoad];
  [self setNavigation];
  self.view.backgroundColor = GRAYCOLOR;
  
  UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 84, Screen_width, 400*Screen_WScale)];
  whiteView.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:whiteView];
  
//  CGSize size = self.view.bounds.size;
  NSString *url = @"http://pic.pimg.tw/loloto/1357207442-1350656755_l.jpg?v=1357207447";
  NHGraphCoder *coder = [NHGraphCoder codeWithURL:url];
//  coder.frame = CGRectMake(25*Screen_WScale, 20, Screen_width - 50*Screen_WScale, 200*Screen_WScale);
  coder.center = CGPointMake(whiteView.frame.size.width*0.5, whiteView.frame.size.height*0.5);
  [coder handleGraphicCoderVerifyEvent:^(NHGraphCoder * _Nonnull cd, BOOL success) {
    DLog(@"验证结果:%d",success);
    if (success) {
      [[NSNotificationCenter defaultCenter]postNotificationName:@"getTestCode" object:nil];
      [self.navigationController popViewControllerAnimated:YES];
    }
  }];
  
  [whiteView addSubview:coder];
}
//-(void)codeHttpRequest{
//  [TH_GifHudView setTH_GifWithImageName:@"round.gif"];
//  [TH_GifHudView show];
//  //  testBtn.userInteractionEnabled = NO;
//  //  testImageBtn.userInteractionEnabled = NO;
////  self.nextBtn.userInteractionEnabled = NO;
//  UserRequest *request = [[UserRequest alloc]init];
//  request.requestSuccessBlock = ^ (AFHTTPRequestOperation *operation,id dic){
//    [TH_GifHudView stop];
//    //    testBtn.userInteractionEnabled = YES;
//    //    testImageBtn.userInteractionEnabled = YES;
////    self.nextBtn.userInteractionEnabled = YES;
////    noNetWorkView.hidden = YES;
//    CLog(@"dic=======%@",dic);
//    //  UUID获取
//    NSString *udidStr = [SvUDIDTools UDID];
//    DLog(@"%@",udidStr);
////    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@&&uniqueNo=%@&&sourceType=1",BASC_HOST,@"login/validatecode.json?",[ZSKJCommonObject getNowTime],udidStr];
//    //    [testImageBtn sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"validatecode"]];
//
//  };
//  request.requestFailBlock = ^(AFHTTPRequestOperation *operation, NSError *error){
//    CLog(@"%@",error);
//    [TH_GifHudView stop];
//    //    testBtn.userInteractionEnabled = YES;
//    //    testImageBtn.userInteractionEnabled = YES;
////    self.nextBtn.userInteractionEnabled = YES;
////    noNetWorkView.hidden = NO;
//  };
//  [request getTestCodeWithSourceType:@"1"];
//}
-(void)btnClick:(UIButton*)btn{
  CLog(@"换一张");
  [self uploadTestPicture];
}
//  获取验证码图片
-(void)uploadTestPicture{
//  [self codeHttpRequest];
}

-(void)setNavigation
{
  navView = [[CustomNav alloc] initWithTitle:@"免费注册" leftTitle:@"" rightTitle:@""];
  navView.delegate = self;
  [self.view addSubview:navView];
}

-(void)backClick{
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
