//
//  IFTTTJazzHandsViewController.m
//  JazzHandsDemo
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHandsViewController.h"

#define NUMBER_OF_PAGES 4

#define timeForPage(page) (NSInteger)(self.view.frame.size.width * (page - 1))

@interface IFTTTJazzHandsViewController ()

@property (strong, nonatomic) UIImageView *wordmark;
@property (strong, nonatomic) UIImageView *unicorn;
@property (strong, nonatomic) UILabel *lastLabel;
@property (strong, nonatomic) UILabel *firstLabel;
@property (strong, nonatomic) UIImageView *topBar;
@property (strong, nonatomic) UIImageView *bottomBar;
@property (strong, nonatomic) UIImageView *bigTopBar;
@property (strong, nonatomic) UIImageView *bigBottomBar;
@property (strong, nonatomic) UIImageView *flowers;
@property (strong, nonatomic) UIImageView *welcome;
@property (strong, nonatomic) UIImageView *cloudsOne;
@property (strong, nonatomic) UIImageView *cloudTwo;
@property (strong, nonatomic) UIImageView *sun;
@property (strong, nonatomic) UIImageView *clock;
@property (strong, nonatomic) UIImageView *wakeUpText;
@property (strong, nonatomic) UIImageView *worldText;
@property (strong, nonatomic) UIImageView *world;
@property (strong, nonatomic) UIButton *close;

- (void) closeIntro;

@end

@implementation IFTTTJazzHandsViewController

- (id)init
{
    if ((self = [super init])) {

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.scrollView.contentSize = CGSizeMake(NUMBER_OF_PAGES * CGRectGetWidth(self.view.frame),
                                             CGRectGetHeight(self.view.frame));
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    
    [self placeViews];
    [self configureAnimation];
    
    self.delegate = self;
}

- (void)placeViews
{
    // place cloudsOne
    self.cloudsOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloudsOne"]];
    self.cloudsOne.center = self.view.center;
    self.cloudsOne.frame = CGRectOffset(
                                     self.cloudsOne.frame,
                                     70,
                                     -225
                                     );
    self.cloudsOne.alpha = 1.0f;
    [self.scrollView addSubview:self.cloudsOne];
    
    
    // place cloudTwo
    self.cloudTwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloudTwo"]];
    self.cloudTwo.center = self.view.center;
    self.cloudTwo.frame = CGRectOffset(
                                        self.cloudTwo.frame,
                                        105,
                                        -225
                                        );
    self.cloudTwo.alpha = 1.0f;
    [self.scrollView addSubview:self.cloudTwo];
    
    
    
    // place sun
    self.sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun"]];
    self.sun.center = self.view.center;
    self.sun.frame = CGRectOffset(
                                       self.sun.frame,
                                       105,
                                       -240
                                       );
    self.sun.alpha = 1.0f;
    [self.scrollView addSubview:self.sun];
    
    
    
    // place welcome
    self.welcome = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome"]];
    self.welcome.center = self.view.center;
    self.welcome.frame = CGRectOffset(
                                     self.welcome.frame,
                                     0,
                                     -120
                                     );
    self.welcome.alpha = 1.0f;
    [self.scrollView addSubview:self.welcome];
    
    
    
    // place top bar
    self.topBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topBar"]];
    self.topBar.center = self.view.center;
    self.topBar.frame = CGRectOffset(
                                      self.topBar.frame,
                                      0,
                                      -80
                                      );
    self.topBar.alpha = 1.0f;
    [self.scrollView addSubview:self.topBar];
    
    
    
    // place flowers
    self.flowers = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flowers"]];
    self.flowers.center = self.view.center;
    self.flowers.frame = CGRectOffset(
                                     self.flowers.frame,
                                     0,
                                     -65
                                     );
    self.flowers.alpha = 1.0f;
    [self.scrollView addSubview:self.flowers];
    
    
    
    // place bottom bar
    self.bottomBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomBar"]];
    self.bottomBar.center = self.view.center;
    self.bottomBar.frame = CGRectOffset(
                                     self.bottomBar.frame,
                                     0,
                                     -50
                                     );
    self.bottomBar.alpha = 1.0f;
    [self.scrollView addSubview:self.bottomBar];
    
    
    // place wakeUpText
    self.wakeUpText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wakeUpText"]];
    self.wakeUpText.center = self.view.center;
    self.wakeUpText.frame = CGRectOffset(
                                        self.wakeUpText.frame,
                                        0,
                                        25
                                        );
    self.wakeUpText.alpha = 1.0f;
    [self.scrollView addSubview:self.wakeUpText];
    
    // place worldText
    self.worldText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"worldText"]];
    self.worldText.center = self.view.center;
    self.worldText.frame = CGRectOffset(
                                         self.worldText.frame,
                                         0,
                                         75
                                         );
    self.worldText.alpha = 1.0f;
    [self.scrollView addSubview:self.worldText];
    
    // place clock
    self.clock = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"introClock"]];
    self.clock.center = self.view.center;
    self.clock.frame = CGRectOffset(
                                        self.clock.frame,
                                        -9.5,
                                        83
                                        );
    self.clock.alpha = 1.0f;
    [self.scrollView addSubview:self.clock];
    
    // place bigTopBar
    self.bigTopBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigTopBar"]];
    self.bigTopBar.center = self.view.center;
    self.bigTopBar.frame = CGRectOffset(
                                    self.bigTopBar.frame,
                                    0,
                                    155
                                    );
    self.bigTopBar.alpha = 1.0f;
    [self.scrollView addSubview:self.bigTopBar];
    
    // place world
    self.world = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"world"]];
    self.world.center = self.view.center;
    self.world.frame = CGRectOffset(
                                           self.world.frame,
                                           0,
                                           205
                                           );
    self.world.alpha = 1.0f;
    [self.scrollView addSubview:self.world];
    
    // place bigBottomBar
    self.bigBottomBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigBottomBar"]];
    self.bigBottomBar.center = self.view.center;
    self.bigBottomBar.frame = CGRectOffset(
                                        self.bigBottomBar.frame,
                                        0,
                                        255
                                        );
    self.bigBottomBar.alpha = 1.0f;
    [self.scrollView addSubview:self.bigBottomBar];

    

    // put a unicorn in the middle of page two, hidden
//    self.unicorn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Unicorn"]];
//    self.unicorn.center = self.view.center;
//    self.unicorn.frame = CGRectOffset(
//        self.unicorn.frame,
//        self.view.frame.size.width,
//        -100
//    );
//    self.unicorn.alpha = 0.0f;
//    [self.scrollView addSubview:self.unicorn];

    // put a logo on top of it
//    self.wordmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IFTTT"]];
//    self.wordmark.center = self.view.center;
//    self.wordmark.frame = CGRectOffset(
//        self.wordmark.frame,
//        self.view.frame.size.width,
//        -100
//    );
//    [self.scrollView addSubview:self.wordmark];
//
//    self.firstLabel = [[UILabel alloc] init];
//    self.firstLabel.text = @"Introducing Wake Up World";
//    [self.firstLabel sizeToFit];
//    self.firstLabel.center = self.view.center;
//    [self.scrollView addSubview:self.firstLabel];
    
    UILabel *secondPageText = [[UILabel alloc] init];
    secondPageText.text = @"text";
    [secondPageText sizeToFit];
    secondPageText.center = self.view.center;
    secondPageText.frame = CGRectOffset(secondPageText.frame, timeForPage(2), 180);
    [self.scrollView addSubview:secondPageText];
    
    UILabel *thirdPageText = [[UILabel alloc] init];
    thirdPageText.text = @"Simple keyframe animations";
    [thirdPageText sizeToFit];
    thirdPageText.center = self.view.center;
    thirdPageText.frame = CGRectOffset(thirdPageText.frame, timeForPage(3), -100);
    [self.scrollView addSubview:thirdPageText];
    
    UILabel *fourthPageText = [[UILabel alloc] init];
    fourthPageText.text = @"Optimized for scrolling intros";
    [fourthPageText sizeToFit];
    fourthPageText.center = self.view.center;
    fourthPageText.frame = CGRectOffset(fourthPageText.frame, timeForPage(4), 0);
    [self.scrollView addSubview:fourthPageText];
    
    self.lastLabel = fourthPageText;
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [closeButton setTitle:@"I'm Ready!" forState:UIControlStateNormal];
    //[closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(timeForPage(4), self.view.frame.size.height - 100, self.view.frame.size.width, 100);
    [closeButton addTarget:self action:@selector(closeIntro) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:closeButton];
    
}

- (void) closeIntro
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)configureAnimation
{
//    CGFloat dy = 240;
    
    // apply a 3D zoom animation to the first label
//    IFTTTTransform3DAnimation * labelTransform = [IFTTTTransform3DAnimation animationWithView:self.firstLabel];
//    IFTTTTransform3D *tt1 = [IFTTTTransform3D transformWithM34:0.03f];
//    IFTTTTransform3D *tt2 = [IFTTTTransform3D transformWithM34:0.3f];
//    tt2.rotate = (IFTTTTransform3DRotate){ -(CGFloat)(M_PI), 1, 0, 0 };
//    tt2.translate = (IFTTTTransform3DTranslate){ 0, 0, 50 };
//    tt2.scale = (IFTTTTransform3DScale){ 1.f, 2.f, 1.f };
//    [labelTransform addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(0)
//                                                                andAlpha:1.0f]];
//    [labelTransform addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1)
//                                                          andTransform3D:tt1]];
//    [labelTransform addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1.5)
//                                                          andTransform3D:tt2]];
//    [labelTransform addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1.5) + 1
//                                                                andAlpha:0.0f]];
//    [self.animator addAnimation:labelTransform];

    // let's animate the wordmark
//    IFTTTFrameAnimation *wordmarkFrameAnimation = [IFTTTFrameAnimation animationWithView:self.wordmark];
//    [self.animator addAnimation:wordmarkFrameAnimation];
//
//    [wordmarkFrameAnimation addKeyFrames:@[
//        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.wordmark.frame, 200, 0)],
//        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:self.wordmark.frame],
//        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andFrame:CGRectOffset(self.wordmark.frame, self.view.frame.size.width, dy)],
//        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andFrame:CGRectOffset(self.wordmark.frame, 0, dy)],
//    ]];

    
    // Rotate a full circle from page 2 to 3
//    IFTTTAngleAnimation *wordmarkRotationAnimation = [IFTTTAngleAnimation animationWithView:self.topBar];
//    [self.animator addAnimation:wordmarkRotationAnimation];
//    
//    [wordmarkRotationAnimation addKeyFrames:@[
//        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.wordmark.frame, 0, -80)],
//        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.wordmark.frame, 0, -45)],
//    ]];
    

    
    IFTTTAngleAnimation *topBarMovment = [IFTTTAngleAnimation animationWithView:self.topBar];
    [self.animator addAnimation:topBarMovment];
    
    [topBarMovment addKeyFrames:@[
        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.topBar.frame, 0, -80)],
        [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.topBar.frame, self.view.frame.size.width, -45)],
                                              ]];
    
    [self.animator addAnimation:topBarMovment];

    
    
    
    
    // now, we animate the unicorn
//    IFTTTFrameAnimation *unicornFrameAnimation = [IFTTTFrameAnimation animationWithView:self.unicorn];
//    [self.animator addAnimation:unicornFrameAnimation];
//    
//    CGFloat ds = 50;
//
//    // move down and to the right, and shrink between pages 2 and 3
//    [unicornFrameAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:self.unicorn.frame]];
//    [unicornFrameAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3)
//                                                                           andFrame:CGRectOffset(CGRectInset(self.unicorn.frame, ds, ds), timeForPage(2), dy)]];
    // fade the unicorn in on page 2 and out on page 4
//    IFTTTAlphaAnimation *unicornAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.unicorn];
//    [self.animator addAnimation:unicornAlphaAnimation];
//    
//    [unicornAlphaAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:0.0f]];
//    [unicornAlphaAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:1.0f]];
//    [unicornAlphaAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andAlpha:1.0f]];
//    [unicornAlphaAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:0.0f]];
//    
//    // Fade out the label by dragging on the last page
//    IFTTTAlphaAnimation *labelAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.lastLabel];
//    [labelAlphaAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:1.0f]];
//    [labelAlphaAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4.35f) andAlpha:0.0f]];
//    [self.animator addAnimation:labelAlphaAnimation];
    
}

#pragma mark - IFTTTAnimatedScrollViewControllerDelegate
//
//- (void)animatedScrollViewControllerDidScrollToEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController
//{
//    NSLog(@"Scrolled to end of scrollview!");
//}
//
//- (void)animatedScrollViewControllerDidEndDraggingAtEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController
//{
//    NSLog(@"Ended dragging at end of scrollview!");
//}

@end
