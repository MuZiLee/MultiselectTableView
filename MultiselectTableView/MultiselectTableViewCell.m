//
//  MultiselectTableViewCell.m
//  MultiselectTableView
//
//  Created by 李飞恒 on 16/12/7.
//  Copyright © 2016年 JerryLee. All rights reserved.
//

#import "MultiselectTableViewCell.h"

@interface MultiselectTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *itemViewA;
@property (weak, nonatomic) IBOutlet UIImageView *itemAImage;
@property (weak, nonatomic) IBOutlet UILabel *itemATitle;


@property (weak, nonatomic) IBOutlet UIView *itemViewB;
@property (weak, nonatomic) IBOutlet UIImageView *itemBImage;
@property (weak, nonatomic) IBOutlet UILabel *itemBTitle;


@property (weak, nonatomic) IBOutlet UIView *itemViewC;
@property (weak, nonatomic) IBOutlet UIImageView *itemCImage;
@property (weak, nonatomic) IBOutlet UILabel *itemCTitle;

@end
@implementation MultiselectTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.itemViewA setHidden:YES];
    [self.itemViewB setHidden:YES];
    [self.itemViewC setHidden:YES];
}

- (void)setItemWityFileType:(NSInteger)type
{
    if ([[self.file objectForKey:@"type"] isEqual:@(1)]) {
        //文件
        switch (type) {
            case 0: {
                //我的云盘
                [self.itemViewB setHidden:NO];//下载
                
                break;
            }
            case 1: {
                //我的共享
                break;
            }
            case 2: {
                //共享给我的
                break;
            }
            case 3: {
                //团队空间
                
                break;
            }
            default:
                break;
        }
    } else {
        //目录
        switch (type) {
            case 0: {
                //我的云盘
                [self.itemViewA setHidden:NO];
                [self.itemViewC setHidden:NO];
                break;
            }
            case 1: {
                //我的共享
                break;
            }
            case 2: {
                //共享给我的
                break;
            }
            case 3: {
                //团队空间
                
                break;
            }
            default:
                break;
        }
    }
    

};


- (IBAction)touchAtion:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(tableViewCellByTableView:indexPath:touch:)]) {
        [self.delegate tableViewCellByTableView:self.tableView indexPath:self.indexPath touch:sender];
    }
}

- (IBAction)itemTouchAction:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(cellItemByTableView:indexPath:touch:)]) {
        [self.delegate cellItemByTableView:self.tableView indexPath:self.indexPath touch:sender];
    }
}


- (void)setNeedsLayout
{
    [super setNeedsLayout];
    

    if ([self.dic[@"open"] isEqual:@(1)]) {

        self.touch.layer.transform = CATransform3DMakeRotation(180 * M_PI / 180, 0, 0, 1);

    } else {
        self.touch.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);

    }
}

@end
