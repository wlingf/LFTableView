//
//  LFTableView.m
//  LFTableViewDemo
//
//  Created by 吴凌锋 on 2019/1/8.
//  Copyright © 2019 wlf. All rights reserved.
//

#import "LFTableView.h"

@interface LFTableView()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation LFTableView

- (instancetype) initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame style:UITableViewStylePlain];
}

- (instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        /// default
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.cellStyle = UITableViewCellStyleDefault;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [self.lfDelegate numberOfSectionsInTableView:tableView];
    }
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.lfDelegate) {
        return [self.lfDelegate tableView:tableView numberOfRowsInSection:section];
    }
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.lfDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 44.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.lfDelegate tableView:tableView heightForHeaderInSection:section];
    }
    return 0.01;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [self.lfDelegate tableView:tableView heightForFooterInSection:section];
    }
    return 0.01;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.lfDelegate tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [self.lfDelegate tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:titleForHeaderInSection:)]) {
        return [self.lfDelegate tableView:tableView titleForHeaderInSection:section];
    }
    return nil;
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:titleForFooterInSection:)]) {
        return [self.lfDelegate tableView:tableView titleForFooterInSection:section];
    }
    return nil;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        NSString *identifier = NSStringFromClass([self.lfDelegate tableView:tableView cellForRowAtIndexPath:indexPath]);
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[NSClassFromString(identifier) alloc] initWithStyle:self.cellStyle reuseIdentifier:identifier];
        }
        if ([self.lfDelegate respondsToSelector:@selector(tableView:cell:cellForRowAtIndexPath:)]) {
            [self.lfDelegate tableView:tableView cell:cell cellForRowAtIndexPath:indexPath];
        }
        return cell;
    }
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:cell:cellForRowAtIndexPath:)]) {
        [self.lfDelegate tableView:tableView cell:cell cellForRowAtIndexPath:indexPath];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.lfDelegate && [self.lfDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.lfDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
