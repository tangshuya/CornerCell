//
//  cornerTableViewCell.m
//  TestCellLayerCorner
//
//  Created by aaa on 2019/3/20.
//  Copyright © 2019年 TangShuya. All rights reserved.
//

#import "cornerTableViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0                                                     \
blue:((float)(rgbValue & 0xFF))/255.0                                                               \
alpha:1.0]
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)

@interface cornerTableViewCell()
@property(nonatomic,strong)UILabel *titleL;
@property(nonatomic,copy)NSString *descPlacehold;
@property(nonatomic,strong)UILabel *describLable;
@end

@implementation cornerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.contentView.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    
//    绘制圆角边框--------------------------
    //圆率
    CGFloat cornerRadius = 5.0f;
    //绘制曲线
    UIBezierPath *bezierPath = nil;
    //大小
//    CGRect bounds = self.bounds;
    CGRect bounds = CGRectMake((self.frame.origin.x)-20, self.frame.origin.y, SCREEN_WIDTH-40, 150);
    //新建一个图层
    CAShapeLayer *linelayer = [CAShapeLayer layer];
    //    //    填充色
    linelayer.fillColor = [UIColor clearColor].CGColor;
//    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    linelayer.path = bezierPath.CGPath;
    linelayer.lineWidth = 2.0f;
//    linelayer.strokeColor = UIColorFromRGB(0xe5e5e5).CGColor;
    linelayer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:linelayer];
    
    UILabel *titleL =[[UILabel alloc] initWithFrame:CGRectMake(15, 10, 100, 24)];
    titleL.textColor = [UIColor blackColor];
    titleL.text =@"姓名" ;
    titleL.font = [UIFont systemFontOfSize:15];
    titleL.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleL];

    self.titleL = titleL;
    
    UILabel *decLable =[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-250, 10, 180, 24)];
    decLable.textColor = [UIColor grayColor];
    decLable.text =@"张三" ;
    decLable.font = [UIFont systemFontOfSize:14];
    decLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:decLable];
    self.describLable = decLable;
    
    //    自定义下划线
    UIView *lineViewOne =[[UIView alloc] initWithFrame:CGRectMake(0, 49, SCREEN_WIDTH, 0.6)];
    lineViewOne.backgroundColor =[UIColor lightGrayColor];
    [self.contentView addSubview:lineViewOne];
    
    UILabel *studyL =[[UILabel alloc] initWithFrame:CGRectMake(15, 60, SCREEN_WIDTH, 30)];
    studyL.textColor = [UIColor blackColor];
    studyL.text =@"学籍号";
    studyL.font = [UIFont systemFontOfSize:15];
    studyL.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:studyL];
    
    UILabel *study =[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-250, 60, 180, 30)];
    study.textColor = [UIColor grayColor];
    study.text =@"G112237373736" ;
    study.font = [UIFont systemFontOfSize:14];
    study.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:study];

    UIView *lineViewTwo =[[UIView alloc] initWithFrame:CGRectMake(0, 99, SCREEN_WIDTH, 0.6)];
    lineViewTwo.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineViewTwo];
    
    UILabel *birthdayL =[[UILabel alloc] initWithFrame:CGRectMake(15, 110, 110, 30)];
    birthdayL.textColor = [UIColor blackColor];
    birthdayL.text =@"学生生日";
    birthdayL.font = [UIFont systemFontOfSize:15];
    birthdayL.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:birthdayL];
    
    UILabel *birthday =[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-250, 110, 180, 30)];
    birthday.textColor = [UIColor grayColor];
    birthday.text =@"2010-01-20" ;
    birthday.font = [UIFont systemFontOfSize:14];
    birthday.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:birthday];
    
    
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleL.text = title;
    [self setNeedsLayout];
    [self setNeedsDisplay];
}
-(void)setName:(NSString *)name{
    _name = name;
    self.describLable.text = name;
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 20;
    frame.size.width -= 40;
;
    
    [super setFrame:frame];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
