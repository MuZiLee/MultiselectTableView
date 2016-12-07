//
//  ViewController.m
//  MultiselectTableView
//
//  Created by 李飞恒 on 16/12/7.
//  Copyright © 2016年 JerryLee. All rights reserved.
//

#import "ViewController.h"
#import "MultiselectTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource, MultiselectTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSources;

@property (nonatomic, strong) NSIndexPath *openIndexPath;

@end

@implementation ViewController
@synthesize dataSources = _dataSources;

static NSString *kCellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSources = [NSMutableArray array];
    for (int i = 0; i< 20; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"open"] = @0;
        dic[@"title"] = [NSNumber numberWithInteger:i];
        [self.dataSources addObject:dic];
    }
    
//    [self.tableView registerClass:[MultiselectTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"MultiselectTableViewCell" bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:kCellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSources count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultiselectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.tableView = tableView;
    cell.indexPath = indexPath;
    cell.delegate = self;
    
    cell.dic = self.dataSources[indexPath.row];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.dataSources[indexPath.row];
    if ([dic[@"open"] isEqual:@(1)]) {
        
        return 126;//68+58;
    } else {
        return 68;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (void)tableViewCellByTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath
                           touch:(UIButton *)touch
{
    if (self.openIndexPath) {
        NSMutableDictionary *dic = self.dataSources[self.openIndexPath.row];
        dic[@"open"] = @(0);
        
        [tableView reloadRowsAtIndexPaths:@[self.openIndexPath] withRowAnimation:(UITableViewRowAnimationNone)];
        self.openIndexPath = nil;
    }
    
    NSMutableDictionary *dic = self.dataSources[indexPath.row];
    dic[@"open"] = @(1);
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    self.openIndexPath = indexPath;
    
}

- (void)cellItemByTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath touch:(UIButton *)touch
{
    MultiselectTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    switch (touch.tag) {
        case 1: {
            NSLog(@"%@:1",cell.dic[@"title"]);
            break;
        }
        case 2: {
            NSLog(@"%@:2",cell.dic[@"title"]);
            break;
        }
        case 3: {
            NSLog(@"%@:3",cell.dic[@"title"]);
            break;
        }
            
            
        default:
            break;
    }
}



@end
