//
//  TripTableViewController.m
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "TripTableViewController.h"
#import "TripCell.h"

static NSString * const cellIdentifier = @"TripCellIdentifier";

@interface TripTableViewController ()

@property (strong, nonatomic) TripVm *viewModel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *destinationButton;

@end

@implementation TripTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Title should be injected during the segue to this VC, but since it's out of the scope of this feature it'll be hard coded
    self.title = @"Berlin ZOB";
    
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
    
    self.viewModel = [[TripVm alloc] initWithDelegate:self];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    refreshControl.backgroundColor = [UIColor lightGrayColor];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(updateData) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refreshControl;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *title = @"Fetching routes...";
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
    
    [self.refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentOffset.y - self.refreshControl.frame.size.height) animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel sectionCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.viewModel sectionTitleAt:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel itemCountAtSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TripCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell configureWithTrip:[self.viewModel itemAtSection:indexPath.section row:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel itemPressedAtSection:indexPath.section row:indexPath.row];
}

#pragma mark - TripVmDelegate

- (void)onTripsUpdated {
    [self updateRefreshControlWithTimestamp];
    [self.tableView reloadData];
}

- (void)onError:(NSError *)error {
    NSLog(@"__Error: %@", error.description);
}

- (void)setTripDestinationToArrivals {
    [self.destinationButton setImage:[UIImage imageNamed:@"ic_arrivals"]];
}

- (void)setTripDestinationToDepartures {
    [self.destinationButton setImage:[UIImage imageNamed:@"ic_departures"]];
}

- (void)presentRouteInformationWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { }]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIRefreshControl

- (void)updateRefreshControlWithTitle:(NSString *)title {
    if (self.refreshControl) {
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        
        [self.refreshControl endRefreshing];
    }
}

- (void)updateRefreshControlWithTimestamp {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    [self updateRefreshControlWithTitle:[NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]]];
}

#pragma mark - Actions

- (IBAction)toggleDestination:(UIBarButtonItem *)sender {
    [self.viewModel toggleDestination];
}

- (void)updateData {
    [self.viewModel refresh];
}

@end
