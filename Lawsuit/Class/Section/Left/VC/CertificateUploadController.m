//
//  CertificateUploadController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/12.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "CertificateUploadController.h"

@interface CertificateUploadController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)UIScrollView* scrollView;
//人像图
@property(nonatomic,strong)UIButton* portrait;
//正面图
@property(nonatomic,strong)UIButton* frontBtn;
//图片标记
@property(nonatomic,assign)NSInteger tagValue;

@end

@implementation CertificateUploadController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"证件上传";
}

-(void)setNavigation{
    [super setNavigation];
    [self.myNav.rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.myNav.rightBtn addTarget:self action:@selector(uploadBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark ---------------UI-------------------
-(void)setUI{
    
    //背景UIScrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth,kScreenHeight-kStatusHeight-44)];
    [self.view addSubview:self.scrollView];
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //人像面
    self.portrait = [UIButton buttonWithType:UIButtonTypeCustom];
    self.portrait.frame = CGRectMake(20, 30,kScreenWidth-40, 160);
    [self.portrait setImage:[UIImage imageNamed:@"certification_ID"] forState:UIControlStateNormal];
    self.portrait.tag = 1000;
    
    self.portrait.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.portrait addTarget:self action:@selector(portraitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.portrait];
    
    //添加重新拍照按钮
    CGFloat rephotoBtnX = CGRectGetMaxX(self.portrait.frame)-90;
    CGFloat rephotoBtnY = CGRectGetMaxY(self.portrait.frame)-40;
    UIButton* rePhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rePhotoBtn.frame = CGRectMake(rephotoBtnX, rephotoBtnY, 80, 20);
    rePhotoBtn.tag = 2000;
    [rePhotoBtn setTitle:@"重新拍摄" forState:UIControlStateNormal];
    [rePhotoBtn addTarget:self action:@selector(rephotoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    rePhotoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    rePhotoBtn.hidden = YES;
    rePhotoBtn.layer.cornerRadius = 10;
    rePhotoBtn.backgroundColor = [UIColor colorWithRed:98/255.0 green:193/255.0 blue:154/255.0 alpha:1.0];
    [self.scrollView addSubview:rePhotoBtn];
    
    //正面像
    CGFloat frontBtnY = CGRectGetMaxY(self.portrait.frame)+20;
    self.frontBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.frontBtn.frame = CGRectMake(20, frontBtnY, kScreenWidth-40, 160);
    [self.frontBtn setImage:[UIImage imageNamed:@"certification_pic"] forState:UIControlStateNormal];
    self.frontBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.frontBtn.tag = 1001;
    [self.frontBtn addTarget:self action:@selector(frontBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.frontBtn];
    //添加重新拍照按钮
    CGFloat rephotoBtnX2 = CGRectGetMaxX(self.frontBtn.frame)-90;
    CGFloat rephotoBtnY2 = CGRectGetMaxY(self.frontBtn.frame)-40;
    UIButton* rePhotoBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    rePhotoBtn2.frame = CGRectMake(rephotoBtnX2, rephotoBtnY2, 80, 20);
    rePhotoBtn2.tag = 2001;
    [rePhotoBtn2 setTitle:@"重新拍摄" forState:UIControlStateNormal];
    rePhotoBtn2.hidden = YES;
    rePhotoBtn2.titleLabel.font = [UIFont systemFontOfSize:15];
    rePhotoBtn2.layer.cornerRadius = 10;
    rePhotoBtn2.backgroundColor = [UIColor colorWithRed:98/255.0 green:193/255.0 blue:154/255.0 alpha:1.0];
    [rePhotoBtn2 addTarget:self action:@selector(rephotoBtnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:rePhotoBtn2];
    CGFloat scrollViewH = CGRectGetMaxY(rePhotoBtn2.frame);
   
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, scrollViewH);
    
    
    
}
#pragma mark 人像面
-(void)portraitBtnClick:(UIButton*)btn{
    NSLog(@"portrait");
    self.tagValue = btn.tag;
    [self tiaoquCamera:NO];
    
}

#pragma mark 人像面重新拍照
-(void)rephotoBtnClick:(UIButton*)btn{
    NSLog(@"rephotoBtn");
    self.tagValue = 1000;
    [self tiaoquCamera:NO];
}
#pragma mark 照片
-(void)frontBtnClick:(UIButton*)btn{
    NSLog(@"frontBtn");
    self.tagValue = btn.tag;
    [self tiaoquCamera:YES];
}
#pragma mark 正面像重新拍照
-(void)rephotoBtnClick2:(UIButton*)btn{
    NSLog(@"rephotoBtnClick2");
    self.tagValue = 1001;
    [self tiaoquCamera:YES];
}
#pragma mark 上传图片功能
-(void)uploadBtnClick:(UIButton*)btn{
    NSLog(@"uploadBtn");
    
    //    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    //    self.hud.mode = MBProgressHUDModeDeterminate;
    //    self.hud.labelText = NSLocalizedString(@"上传中...", @"HUD loading title");
    //网络请求
    NSString* urlStr=[NSString stringWithFormat:@"%@api/Authentication/uploadphoto",REQURL];
    //人像面
    UIImage* portraitImage = self.portrait.imageView.image;
    UIImage* reportraitImage = [UIImage fixOrientation:portraitImage];
    NSData* portraitData = UIImageJPEGRepresentation(reportraitImage, 0.3);
    //正面像
    UIImage* frontImage = self.frontBtn.imageView.image;
    UIImage* refrontImage = [UIImage fixOrientation:frontImage];
    NSData* frontData = UIImageJPEGRepresentation(refrontImage, 0.5);
    
    NSDictionary* paraDic=@{@"userid":@""};
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *fileName = [formatter stringFromDate:[NSDate date]];
    [manager POST:urlStr parameters:paraDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSLog(@"%@",[NSString stringWithFormat:@"idcardimg%@.jpg",fileName]);
        [formData appendPartWithFileData:portraitData name:@"idcardimg" fileName:[NSString stringWithFormat:@"idcardimg%@.jpg",fileName] mimeType:@"image/png"];
        
        [formData appendPartWithFileData:frontData name:@"photo" fileName:[NSString stringWithFormat:@"photo%@.jpg",fileName] mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //            self.hud.progress=uploadProgress.fractionCompleted;
            //            if (uploadProgress.fractionCompleted>=1.0) {
            //                self.hud.mode = MBProgressHUDModeIndeterminate;
            //                self.hud.labelText= NSLocalizedString(@"处理中...", @"HUD handling title");
            //            }
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:(NSUTF8StringEncoding)]);
        NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //        self.hud.labelText=NSLocalizedString(dic[@"msg"], @"HUD completed title");
        //        self.hud.mode = MBProgressHUDModeText;
        NSLog(@"[%@]",dic);
        
        if ([dic[@"code"] integerValue]==2043) {
            NSString* urlStr=[NSString stringWithFormat:@"%@api/Authentication/authphoto",REQURL];
            NSDictionary* paramsDic = @{@"userid":@""};
            //            self.hud.labelText=NSLocalizedString(@"识别中，请耐心等待...", @"HUD completed title");
            //            self.hud.mode = MBProgressHUDModeIndeterminate;
            [manager GET:urlStr parameters:paramsDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                NSLog(@"%@",dic);
                //                self.hud.labelText=dic[@"msg"];
                //                self.hud.mode = MBProgressHUDModeText;
                //                [self.hud hide:YES afterDelay:2.0];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        self.hud.labelText=NSLocalizedString(@"请检查网络状态", @"HUD completed title");
        //        self.hud.mode = MBProgressHUDModeText;
        //        [self.hud hide:YES afterDelay:2.0];
        NSLog(@"%@",error.debugDescription);
    }];
    
    
}
#pragma mark 调取相机
-(void)tiaoquCamera:(BOOL)flag{
    UIImagePickerControllerSourceType CameraType = UIImagePickerControllerSourceTypeCamera;
    //判断相机是否可用
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //不可用时将sourceType设定为相片库
        CameraType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = CameraType;
    
    [self presentViewController:picker animated:YES completion:^{
        
        if (flag) {
            picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        }else{
            picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        }
    }];
}
#pragma mark-拍完照片回调系统相机的方法
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image1 = [info objectForKey:UIImagePickerControllerOriginalImage] ;
    UIButton* btn = [self.scrollView viewWithTag:self.tagValue];
    btn.backgroundColor = [UIColor blackColor];
    btn.enabled = NO;
    [btn setImage:image1 forState:UIControlStateDisabled];
    UIButton* reBtn = [self.scrollView viewWithTag:self.tagValue+1000];
    reBtn.hidden = NO;
    
    if (self.tagValue==1000) {
        //第一个肯定有了，上传按钮的状态取决于第二个。
        UIButton* btn2 = [self.scrollView viewWithTag:self.tagValue+1];
        self.myNav.rightBtn.enabled = !btn2.enabled;
    }
    if (self.tagValue==1001) {
        //第二个肯定有了，上传按钮的状态取决于第一个。
        UIButton* btn2 = [self.scrollView viewWithTag:self.tagValue-1];
        self.myNav.rightBtn.enabled = !btn2.enabled;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
