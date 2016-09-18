//
//  ViewController.m
//  AttributedStringDemo
//
//  Created by yongliangP on 16/9/13.
//  Copyright © 2016年 yongliangP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHight;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // NSLog(@"%@",[UIFont familyNames]);
    
    //第一种方式
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是第一种方式，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
    [attrStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"Papyrus" size: 15] range: NSMakeRange(0, attrStr.length)];
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5.0;
    [attrStr addAttribute: NSParagraphStyleAttributeName value: style range: NSMakeRange(0, attrStr.length)];
    self.firstLabel.attributedText = attrStr;
    
    //第二种方式
    NSDictionary * dict = @{
                            NSFontAttributeName:[UIFont fontWithName: @"Papyrus" size: 15],
                            [UIFont fontWithName: @"Papyrus" size: 15]:style
                            };
    NSMutableAttributedString * attrStr2 = [[NSMutableAttributedString alloc] initWithString:@"我是第二种方式，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" attributes:dict];
    self.secondLabel.attributedText = attrStr2;
    
    
    self.topViewHight.constant = 10 + CGRectGetHeight(self.firstLabel.frame)+ 10 + CGRectGetHeight(self.secondLabel.frame) + 10;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 30;
    
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 44;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * cellName = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    cell.textLabel.numberOfLines = 0;
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"text"];
    
    switch (indexPath.row)
    {
        case 0:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSFontAttributeName 字体：Papyrus 字号：15"];
            [attrStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"Papyrus" size: 15] range: NSMakeRange(0, attrStr.length)];
            break;
            
        case 1:
        {
            NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
            style.lineSpacing = 10.0;
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSParagraphStyleAttributeName \n行间距 10"];
            [attrStr addAttribute: NSParagraphStyleAttributeName value: style range: NSMakeRange(0, attrStr.length)];
        }
            break;
            
        case 2:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSForegroundColorAttributeName 颜色orangeColor"];
            [attrStr addAttribute: NSForegroundColorAttributeName value: [UIColor orangeColor] range: NSMakeRange(0, attrStr.length)];
            break;
            
        case 3:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSBackgroundColorAttributeName 背景颜色red"];
            [attrStr addAttribute: NSBackgroundColorAttributeName value: [UIColor redColor] range: NSMakeRange(0, attrStr.length)];
            break;
            
        case 4:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSLigatureAttributeName 'fl' 连体属性 1"];
            [attrStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"PingFang SC" size: 15] range: NSMakeRange(0, attrStr.length)];
            [attrStr addAttribute: NSLigatureAttributeName value: @(1) range: NSMakeRange(0, attrStr.length)];
            break;
        case 5:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSKernAttributeName  字符间距 2"];
            [attrStr addAttribute: NSKernAttributeName value: @(2) range: NSMakeRange(0, attrStr.length)];
            break;
        case 6:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSStrikethroughStyleAttributeName  删除线 1"];
            [attrStr addAttribute: NSStrikethroughStyleAttributeName value: @(1) range: NSMakeRange(0, attrStr.length)];
            break;
        case 7:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSUnderlineStyleAttributeName  下划线 NSUnderlineStyleSingle"];
            [attrStr addAttribute: NSUnderlineStyleAttributeName value: @(NSUnderlineStyleSingle) range: NSMakeRange(0, attrStr.length)];
            break;
        case 8:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSStrokeColorAttributeName 配合NSStrokeWidthAttributeName使用"];
            [attrStr addAttribute: NSStrokeColorAttributeName value: [UIColor redColor] range: NSMakeRange(0, attrStr.length)];
            [attrStr addAttribute: NSStrokeWidthAttributeName value: @(2) range: NSMakeRange(0, attrStr.length)];
            break;
        case 9:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSStrokeWidthAttributeName 配合NSStrokeColorAttributeName使用"];
            [attrStr addAttribute: NSStrokeWidthAttributeName value: @(-2) range: NSMakeRange(0, attrStr.length)];
            [attrStr addAttribute: NSStrokeColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0, attrStr.length)];
            break;
        case 10:
            
        { attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSShadowAttributeName 竖直方向偏移 15"];
            NSShadow * shadow = [[NSShadow alloc] init];
            shadow.shadowColor = [UIColor grayColor];
            shadow.shadowOffset = CGSizeMake(0, 15);
            [attrStr addAttribute: NSShadowAttributeName value:shadow range: NSMakeRange(0, attrStr.length)];
        }
            break;
        case 11:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSTextEffectAttributeName 模式NSTextEffectLetterpressStyle"];
            [attrStr addAttribute: NSTextEffectAttributeName value:NSTextEffectLetterpressStyle range: NSMakeRange(0, attrStr.length)];
            
            break;
        case 12:
        {
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSAttachmentAttributeName "];
            NSTextAttachment * textAtt = [[NSTextAttachment alloc] init];
            textAtt.image = [UIImage imageNamed:@"tag_d"];
            textAtt.bounds = CGRectMake(0, 0, 44, 44);
            NSAttributedString *attrStr2 = [NSAttributedString attributedStringWithAttachment: textAtt];
            [attrStr insertAttributedString: attrStr2 atIndex: 6];
            
        }
            break;
        case 13:
        {
            //            UITextView *textView = [[UITextView alloc] init];
            //            textView.scrollEnabled = NO;
            //            textView.editable = NO;
            //            textView.frame =cell.bounds;
            //            textView.textContainer.lineFragmentPadding = 0;
            //            textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
            //            textView.delegate = self;
            //            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSLinkAttributeName 测试 百度"];
            //            [attrStr addAttribute: NSLinkAttributeName value:[NSURL URLWithString: @"http://www.baidu.com"] range: NSMakeRange(0, attrStr.length)];
            //            textView.attributedText = attrStr;
            //            [cell.contentView addSubview:textView];
            //
            //            return cell;
        }
            break;
        case 14:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSBaselineOffsetAttributeName 偏移5"];
            [attrStr addAttribute: NSBaselineOffsetAttributeName value: @(5) range: NSMakeRange(0, attrStr.length)];
            break;
        case 15:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSUnderlineColorAttributeName "];
            [attrStr addAttribute: NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range: NSMakeRange(0, attrStr.length)];
            [attrStr addAttribute: NSUnderlineColorAttributeName value:[UIColor yellowColor] range: NSMakeRange(0, attrStr.length)];
            break;
        case 16:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSStrikethroughColorAttributeName "];
            [attrStr addAttribute: NSStrikethroughStyleAttributeName value:@(1) range: NSMakeRange(0, attrStr.length)];
            [attrStr addAttribute: NSStrikethroughColorAttributeName value:[UIColor brownColor] range: NSMakeRange(0, attrStr.length)];
            break;
        case 17:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSStrikethroughColorAttributeName 右倾斜"];
            [attrStr addAttribute: NSObliquenessAttributeName value:@(1) range: NSMakeRange(0, attrStr.length)];
            
            break;
        case 18:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSExpansionAttributeName 横向压"];
            [attrStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"Papyrus" size: 12] range: NSMakeRange(0, attrStr.length)];
            [attrStr addAttribute: NSExpansionAttributeName value:@(1) range: NSMakeRange(0, attrStr.length)];
            
            break;
        case 19:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSWritingDirectionAttributeName 方式NSWritingDirectionLeftToRight&Embedding"];
            [attrStr addAttribute: NSWritingDirectionAttributeName value:@[@(NSWritingDirectionLeftToRight | NSWritingDirectionEmbedding)] range: NSMakeRange(0, attrStr.length)];
            break;
        case 20:
            attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是NSVerticalGlyphFormAttributeName "];
            [attrStr addAttribute: NSVerticalGlyphFormAttributeName value:@(0) range: NSMakeRange(0, attrStr.length)];
            break;
            
        default:
            break;
    }
    
    cell.textLabel.attributedText = attrStr;
    
    return cell;
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)url inRange:(NSRange)characterRange
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
