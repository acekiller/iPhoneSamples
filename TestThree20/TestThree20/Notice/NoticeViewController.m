//
//  NoticeViewController.m
//  TestThree20
//
//  Created by Kosuke Matsuda on 11/09/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoticeViewController.h"


@implementation NoticeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

#pragma mark - ContentBaseViewController override methods

- (void)replaceNavigationButton
{
    self.title = @"Facebook";
    UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithTitle:@"return" style:UIBarButtonItemStyleDone target:self action:@selector(didTapButtonToReturn:)];
    self.navigationItem.rightBarButtonItem = returnButton;
    [returnButton release];
}

- (void)didTapButtonToReturn:(id)sender
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

@end
