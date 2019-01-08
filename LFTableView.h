//
//  LFTableView.h
//  LFTableViewDemo
//
//  Created by 吴凌锋 on 2019/1/8.
//  Copyright © 2019 wlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFTableViewDelegate <NSObject>

@required

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (Class) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void) tableView:(UITableView *)tableView cell:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView;

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LFTableView : UITableView

@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic, assign) UITableViewCellStyle cellStyle;

@property (nonatomic, weak) id<LFTableViewDelegate> lfDelegate;

- (instancetype) initWithFrame:(CGRect)frame;
- (instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end

