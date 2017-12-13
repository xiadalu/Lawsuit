//
//  RealNameCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/11.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "RealNameCell.h"
#import "CustomTextField.h"
#import "WXZCustomPickView.h"

@interface RealNameCell()<CustomPickViewDelegate>

@property(nonatomic,strong)CustomTextField* realName;

@property(nonatomic,strong)UIButton* manBtn;

@property(nonatomic,strong)UIButton* womanBtn;

@property(nonatomic,strong)UIButton* idenBtn;

@property(nonatomic,strong)WXZCustomPickView* pickerSingle;

@property(nonatomic,strong)CustomTextField* idenTextField;


@end


@implementation RealNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUI];
        
    }
    return self;
}
#pragma mark UI
-(void)creatUI{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 20)];
    label.text = @"真实姓名";
    [self.contentView addSubview:label];
    CGFloat realNameY = CGRectGetMaxY(label.frame)+10;
    self.realName = [[CustomTextField alloc] initWithFrame:CGRectMake(10, realNameY, kScreenWidth-20, 40) leftImageName:@"login_password" rightImageName:@"" placeholder:@"请输入真实姓名"];
    [self.contentView addSubview:self.realName];
    
    CGFloat label2Y = CGRectGetMaxY(self.realName.frame)+10;
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, label2Y, 100, 30)];
    label2.text = @"用户性别：";
    [self.contentView addSubview:label2];
    
    CGFloat manBtnX = CGRectGetMaxX(label2.frame)+(kScreenWidth-120-100)/3;
    self.manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.manBtn.frame = CGRectMake(manBtnX, label2Y, 50, 30);
    [self.manBtn setImage:[UIImage imageNamed:@"checked_checkbox"] forState:UIControlStateSelected];
    [self.manBtn setImage:[UIImage imageNamed:@"unchecked_checkbox"] forState:UIControlStateNormal];
    self.manBtn.tag = 2000;
    [self.manBtn setTitle:@" 男" forState:UIControlStateNormal];
    [self.manBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.manBtn addTarget:self action:@selector(selectIden:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.manBtn];
    
    CGFloat womanBtnX = CGRectGetMaxX(self.manBtn.frame)+(kScreenWidth-120-100)/3;
    
    self.womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.womanBtn.frame = CGRectMake(womanBtnX, label2Y, 50, 30);
    [self.womanBtn setTitle:@" 女" forState:UIControlStateNormal];
    [self.womanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.womanBtn setImage:[UIImage imageNamed:@"checked_checkbox"] forState:UIControlStateSelected];
    [self.womanBtn setImage:[UIImage imageNamed:@"unchecked_checkbox"] forState:UIControlStateNormal];
    self.womanBtn.tag = 2001;
    [self.womanBtn addTarget:self action:@selector(selectIden:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.womanBtn];
    
    CGFloat idenBtnY = CGRectGetMaxY(self.womanBtn.frame)+10;
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.frame = CGRectMake(10, idenBtnY, kScreenWidth-20, 40);
    cell.layer.cornerRadius = 20;
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor cz_colorWithRed:236 green:236 blue:236].CGColor;
    [self.contentView addSubview:cell];
    
    self.idenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.idenBtn.frame = CGRectMake(20, 0, kScreenWidth-60, 40);
    self.idenBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.idenBtn setTitle:@"选择证件类型" forState:UIControlStateNormal];
    [self.idenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.idenBtn addTarget:self action:@selector(idenBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:self.idenBtn];
    
    CGFloat idenTextFieldY = CGRectGetMaxY(cell.frame)+10;
    self.idenTextField = [[CustomTextField alloc] initWithFrame:CGRectMake(10, idenTextFieldY, kScreenWidth-20, 40) leftImageName:@"login_password" rightImageName:@"" placeholder:@"请输入证件号..."];
    [self.contentView addSubview:self.idenTextField];
}
-(void)idenBtnClick:(UIButton*)btn{
    [self.pickerSingle show];
    [self endEditing:YES];
}

-(void)customPickView:(WXZCustomPickView *)customPickView selectedTitle:(NSString *)selectedTitle{
    [self.idenBtn setTitle:selectedTitle forState:UIControlStateNormal];
}


-(void)selectIden:(UIButton*)btn{
    //    btn.selected = !btn.selected;
    for (UIView* tempView in self.contentView.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton* currentBtn = (UIButton*)tempView;
            if (currentBtn.tag == btn.tag) {
                currentBtn.selected = YES;
                currentBtn.userInteractionEnabled = NO;
            }else{
                currentBtn.selected = NO;
                currentBtn.userInteractionEnabled = YES;
            }
        }
    }
}
#pragma mark 懒加载
-(WXZCustomPickView*)pickerSingle{
    if (!_pickerSingle) {
        NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"身份证",@"护照", nil];
        _pickerSingle = [[WXZCustomPickView alloc] init];
        
        [_pickerSingle setDataArray:arrayData];
        [_pickerSingle setDefalutSelectRowStr:arrayData[0]];
        
        
        [_pickerSingle setDelegate:self];
    }
    return _pickerSingle;
}

@end
