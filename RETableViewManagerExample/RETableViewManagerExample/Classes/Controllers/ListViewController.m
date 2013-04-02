//
//  ListViewController.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 3/17/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "ListViewController.h"
#import "ListHeaderView.h"
#import "ListImageItem.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"List";
    
    // Create manager
    //
    _manager = [[RETableViewManager alloc] init];
    
    // Map item to a cell
    //
    [_manager mapObjectClass:@"ListImageItem" toTableViewCellClass:@"ListImageCell"];
    
    // Set delegate and datasource
    //
    self.tableView.dataSource = _manager;
    self.tableView.delegate = _manager;
    
    // Setup mappgin
    
    // Set some UITableView properties
    //
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSArray *items = @[@{@"username": @"john",
                         @"userpic_url": @"http://uifaces.com/faces/_twitter/utroda_120.jpg",
                         @"image_url": @"http://distilleryimage10.instagram.com/09b742a2962611e2a84922000a1f8c0f_7.jpg"},
                       
                       @{@"username": @"mark",
                         @"userpic_url": @"http://uifaces.com/faces/_twitter/eldelentes_120.jpg",
                         @"image_url": @"http://distilleryimage10.instagram.com/09b742a2962611e2a84922000a1f8c0f_7.jpg"},
                       
                       @{@"username": @"william",
                         @"userpic_url": @"http://uifaces.com/faces/_twitter/daniel_love_120.jpg",
                         @"image_url": @"http://distilleryimage10.instagram.com/09b742a2962611e2a84922000a1f8c0f_7.jpg"},
                       
                       @{@"username": @"gretchen",
                         @"userpic_url": @"http://uifaces.com/faces/_twitter/JuliaYunLiu_120.jpg",
                         @"image_url": @"http://distilleryimage10.instagram.com/09b742a2962611e2a84922000a1f8c0f_7.jpg"}
                       ];
    
    RETableViewSection *section;
    
    for (NSDictionary *dictionary in items) {
        NSString *username = [dictionary objectForKey:@"username"];
        NSURL *userpicURL = [NSURL URLWithString:[dictionary objectForKey:@"userpic_url"]];
        NSURL *imageURL = [NSURL URLWithString:[dictionary objectForKey:@"image_url"]];
        
        // Create section
        //
        section = [[RETableViewSection alloc] initWithHeaderView:[ListHeaderView headerViewWithImageURL:userpicURL username:username]];
        [_manager addSection:section];
        
        [section addItem:[ListImageItem itemWithImageURL:imageURL]];
    }
}

@end