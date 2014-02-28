//
//  SNOWAttendeeListViewController.m
//  NSSnow
//
//  Created by Kyle Fuller on 28/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "SNOWAttendeeListViewController.h"
#import "SNOWEvent.h"
#import "SNOWAttendee.h"

@interface SNOWAttendeeListViewController ()

@property (nonatomic, strong) NSArray *events;

@end

@implementation SNOWAttendeeListViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (NSString *)title {
    return NSLocalizedString(@"ATTENDEE_LIST_TITLE", nil);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 60.0f;

    [SNOWEvent get:^(NSArray *events, NSError *error) {
        if (events) {
            self.events = events;
            [self.tableView reloadData];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil] show];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.events count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SNOWEvent *event = self.events[section];
    return [event.attendees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell) {
        [cell.imageView cancelImageRequestOperation];
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.imageView.layer.cornerRadius = 20.0f;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.imageView.clipsToBounds = YES;
    }

    SNOWEvent *event = self.events[indexPath.section];
    SNOWAttendee *attendee = event.attendees[indexPath.row];
    cell.textLabel.text = attendee.name;
    cell.accessibilityLabel = attendee.name;
    [cell.imageView setImageWithURL:attendee.avatarURL];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    __unused SNOWEvent *event = self.events[section];
    return @"2014";
}

@end
