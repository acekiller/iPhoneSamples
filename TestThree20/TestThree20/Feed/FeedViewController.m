//
//  FeedViewController.m
//  TestThree20
//
//  Created by Kosuke Matsuda on 11/09/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FeedViewController.h"

#import "FeedDataSource.h"

@interface FeedViewController (PrivateMethods)
- (void)replaceNavigationButton;
@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Feed title";
        self.variableHeightRows = YES;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self replaceNavigationButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)replaceNavigationButton
{
    self.title = @"Facebook";
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithTitle:@"return" style:UIBarButtonItemStyleDone target:self action:@selector(didTapButtonToReturn:)];
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = returnButton;
    [returnButton release];
}

- (void)didTapButtonToReturn:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - TTModel


- (void)createModel
{
    self.dataSource = [[[FeedDataSource alloc] initWithSearchQuery:@"three20"] autorelease];
}

- (id<UITableViewDelegate>)createDelegate
{
    return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

@end
