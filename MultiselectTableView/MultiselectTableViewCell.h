//
//  MultiselectTableViewCell.h
//  MultiselectTableView
//
//  Created by 李飞恒 on 16/12/7.
//  Copyright © 2016年 JerryLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MultiselectTableViewCellDelegate;

@interface MultiselectTableViewCell : UITableViewCell
@property (nonatomic, assign, setter=setOpen:, getter=isopen) BOOL isOpen;

// file type image
@property (weak, nonatomic) IBOutlet UIImageView *icon;
// file name
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// file creator teme and file size
@property (weak, nonatomic) IBOutlet UILabel *timeAndSize;
// right touch button
@property (weak, nonatomic) IBOutlet UIButton *touch;

//---------------------------------------------
@property (nonatomic, strong) id file;

//---------------------------------------------
@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, weak) id <MultiselectTableViewCellDelegate> delegate;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@protocol MultiselectTableViewCellDelegate <NSObject>

// right touch button action tag 0      indexpath.rom
- (void)tableViewCellByTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath touch:(UIButton *)touch;

// bottom items touch action tag 1-3    indexpath.rom
- (void)cellItemByTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath touch:(UIButton *)touch;



@end