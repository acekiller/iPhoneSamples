//
//  TestCarouselViewController.m
//  TestCarousel
//
//  Created by Kosuke Matsuda on 11/12/05.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TestCarouselViewController.h"

@interface TestCarouselViewController ()
- (void)setupScrollView;
- (void)setIcons;
@end

@implementation TestCarouselViewController

@synthesize scrollView = _scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    self.view.backgroundColor = [UIColor blackColor];
    [self setupScrollView];
    [self setIcons];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.scrollView = nil;
}

- (void)dealloc
{
    [_scrollView release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Private methods

- (void)setupScrollView
{
    CGRect rect = CGRectMake(0, 352, self.view.bounds.size.width, 0);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    // scrollView.contentOffset = CGPointMake(self.view.bounds.size.width * currentIndex, 0);
    scrollView.backgroundColor = [UIColor whiteColor];
    // scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;

    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    [scrollView release];
}

- (void)setIcons
{
    UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    CGPoint p = CGPointZero;

    for (int i = 0; i < 10; i++) {
        UIImage *icon = [UIImage imageNamed:[NSString stringWithFormat:@"image%04d.png", i + 1]];

        CGRect rect = iconView.frame;
        rect.size.width += icon.size.width;
        rect.size.height = icon.size.height;
        iconView.frame = rect;

        /*
         imageとして表示する場合
         UIImageView *imageView = [[UIImageView alloc] initWithImage:icon];
         CGRect imageViewRect = CGRectMake(p.x, p.y, icon.size.width, icon.size.height);
         imageView.frame = imageViewRect;
         [iconView addSubview:imageView];
         [imageView release];
         */

        // buttonとして表示
        CGRect buttonRect = CGRectMake(p.x, p.y, icon.size.width, icon.size.height);
        UIButton *button = [[UIButton alloc] initWithFrame:buttonRect];
        [button setImage:icon forState:UIControlStateNormal];
        [iconView addSubview:button];
        // [self setActionToButton:button index:i];
        [button release];

        p.x += icon.size.width;
        [icon release];
    }

    CGRect rect = self.scrollView.frame;
    rect.size.height = iconView.frame.size.height;
    self.scrollView.frame = rect;
    [self.scrollView addSubview:iconView];
    self.scrollView.contentSize = iconView.bounds.size;

    [iconView release];
}

@end
