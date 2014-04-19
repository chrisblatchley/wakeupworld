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
@property (strong, nonatomic) UIImageView *introClock;
@property (strong, nonatomic) UIImageView *wakeUpText;
@property (strong, nonatomic) UIImageView *worldText;
@property (strong, nonatomic) UIImageView *world;
@property (strong, nonatomic) UIButton *close;
@property (strong, nonatomic) UIImageView *secondScreenText;
@property (strong, nonatomic) UILabel *screenOne;
@property (strong, nonatomic) UIImageView *thirdScreenText;
@property (strong, nonatomic) UIImageView *or;
@property (strong, nonatomic) UIImageView *buttonOne;
@property (strong, nonatomic) UIImageView *buttonTwo;
@property (strong, nonatomic) UIImageView *WUWlogoIntro;
@property (strong, nonatomic) UIImageView *FourthScreenText;




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
                                       -237
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
                                     self.view.frame.size.width * .0,
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
    self.introClock = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"introClock"]];
    self.introClock.center = self.view.center;
    self.introClock.frame = CGRectOffset(
                                        self.introClock.frame,
                                        -9.5,
                                        83
                                        );
    self.introClock.alpha = 1.0f;
    [self.scrollView addSubview:self.introClock];
    
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
    
    
//    second screen text
    self.secondScreenText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"secondScreenText"]];
    self.secondScreenText.center = self.view.center;
    self.secondScreenText.frame = CGRectOffset(
                                           self.secondScreenText.frame,
                                           self.view.frame.size.width,
                                           -107
                                           );
    self.secondScreenText.alpha = 1.0f;
    [self.scrollView addSubview:self.secondScreenText];
    
    //    third screen text
    self.thirdScreenText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3rdScreenText"]];
    self.thirdScreenText.center = self.view.center;
    self.thirdScreenText.frame = CGRectOffset(
                                               self.thirdScreenText.frame,
                                               self.view.frame.size.width *2,
                                               -5
                                               );
    self.thirdScreenText.alpha = 1.0f;
    [self.scrollView addSubview:self.thirdScreenText];
    
    
    
    self.buttonOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"introButtonOne"]];
    self.buttonOne.center = self.view.center;
    self.buttonOne.frame = CGRectOffset(
                                              self.buttonOne.frame,
                                              self.view.frame.size.width *2 -30,
                                              -105
                                              );
    self.buttonOne.alpha = 1.0f;
    [self.scrollView addSubview:self.buttonOne];
    
    self.buttonTwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"introButtonTwo"]];
    self.buttonTwo.center = self.view.center;
    self.buttonTwo.frame = CGRectOffset(
                                        self.buttonTwo.frame,
                                        self.view.frame.size.width *2 +30,
                                        10
                                        );
    self.buttonTwo.alpha = 1.0f;
    [self.scrollView addSubview:self.buttonTwo];
    
    
    self.or = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"or"]];
    self.or.center = self.view.center;
    self.or.frame = CGRectOffset(
                                        self.or.frame,
                                        self.view.frame.size.width *2,
                                        -47
                                        );
    self.or.alpha = 1.0f;
    [self.scrollView addSubview:self.or];
    
    
    self.FourthScreenText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FourthScreenText"]];
    self.FourthScreenText.center = self.view.center;
    self.FourthScreenText.frame = CGRectOffset(
                                 self.FourthScreenText.frame,
                                 self.view.frame.size.width *3,
                                 -47
                                 );
    self.FourthScreenText.alpha = 1.0f;
    [self.scrollView addSubview:self.FourthScreenText];
    
    
    self.WUWlogoIntro = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WUWlogoIntro"]];
    self.WUWlogoIntro.center = self.view.center;
    self.WUWlogoIntro.frame = CGRectOffset(
                                               self.WUWlogoIntro.frame,
                                               self.view.frame.size.width *3,
                                               100
                                               );
    self.WUWlogoIntro.alpha = 1.0f;
    [self.scrollView addSubview:self.WUWlogoIntro];
    
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
//    clouds one movement
    IFTTTFrameAnimation *cloudsOneMovement = [IFTTTFrameAnimation animationWithView:self.cloudsOne];
    [self.animator addAnimation:cloudsOneMovement];
    
    [cloudsOneMovement addKeyFrames:@[
                                  [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.cloudsOne.frame, 0, 0)],
                                  [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.cloudsOne.frame, self.view.frame.size.width -4, 0)],
                                  [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andFrame:CGRectOffset(self.cloudsOne.frame, self.view.frame.size.width *2 -10, 0)],
                                  [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andFrame:CGRectOffset(self.cloudsOne.frame, self.view.frame.size.width *3 -19, 3)],
                                  ]];
    
    //    cloud two movement
    IFTTTFrameAnimation *cloudTwoMovement = [IFTTTFrameAnimation animationWithView:self.cloudTwo];
    [self.animator addAnimation:cloudTwoMovement];
    
    [cloudTwoMovement addKeyFrames:@[
                                      [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.cloudTwo.frame, 0, 0)],
                                      [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.cloudTwo.frame, self.view.frame.size.width +3, 8)],
                                      [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andFrame:CGRectOffset(self.cloudTwo.frame, self.view.frame.size.width *2 -6, 14)],
                                      [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andFrame:CGRectOffset(self.cloudTwo.frame, self.view.frame.size.width *3 -8, 22)],
                                      ]];
    
    //    sun movement
    IFTTTFrameAnimation *sunMovement = [IFTTTFrameAnimation animationWithView:self.sun];
    [self.animator addAnimation:sunMovement];
    
    [sunMovement addKeyFrames:@[
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.sun.frame, 0, 0)],
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.sun.frame, self.view.frame.size.width + 2, -1)],
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andFrame:CGRectOffset(self.sun.frame, self.view.frame.size.width *2 +2, -1)],
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andFrame:CGRectOffset(self.sun.frame, self.view.frame.size.width *3, 0)],
                                     ]];

    //    top bar movement
    IFTTTFrameAnimation *topBarMovment = [IFTTTFrameAnimation animationWithView:self.topBar];
    [self.animator addAnimation:topBarMovment];
    
    [topBarMovment addKeyFrames:@[
                                           [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.topBar.frame, 0, 0)],
                                           [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.topBar.frame, self.view.frame.size.width, -110)],
                                           [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andFrame:CGRectOffset(self.topBar.frame, self.view.frame.size.width *2, -110)],
                                           [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andFrame:CGRectOffset(self.topBar.frame, self.view.frame.size.width *2, 240)],
                                           ]];
    
    //    bottom bar movement
    IFTTTFrameAnimation *bottomBarMovment = [IFTTTFrameAnimation animationWithView:self.bottomBar];
    [self.animator addAnimation:bottomBarMovment];
    
    [bottomBarMovment addKeyFrames:@[
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.bottomBar.frame, 0, 0)],
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(self.bottomBar.frame, self.view.frame.size.width, 20)],
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andFrame:CGRectOffset(self.bottomBar.frame, self.view.frame.size.width *2, 230)],
                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andFrame:CGRectOffset(self.bottomBar.frame, 0, 140)],
                                     ]];

    IFTTTFrameAnimation *clockAnimation = [IFTTTFrameAnimation animationWithView:self.introClock];
        [self.animator addAnimation:clockAnimation];
    
        [clockAnimation addKeyFrames:@[
                                      [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:self.introClock.frame],
                                      [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(CGRectInset(self.introClock.frame, -20, -20), self.view.frame.size.width, +130)],
                                       ]];
    
    
    
    
    
    
    //    animations
    // second screen text animation
    IFTTTAlphaAnimation *secondScreenTextAnimation = [IFTTTAlphaAnimation animationWithView:self.secondScreenText];
    [self.animator addAnimation:secondScreenTextAnimation];
    
    [secondScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:0.0f]];
    [secondScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:1.0f]];
    [secondScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andAlpha:0.0f]];
    [secondScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:0.0f]];
    
    // first screen text animation
    IFTTTAlphaAnimation *firstScreenTextAnimation = [IFTTTAlphaAnimation animationWithView:self.world];
    [self.animator addAnimation:secondScreenTextAnimation];
    
    [firstScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f]];
    [firstScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f]];
    [firstScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andAlpha:0.0f]];
    [firstScreenTextAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:0.0f]];
    
    // first screen text animation
    IFTTTAlphaAnimation *firstScreenWakeUpAnimation = [IFTTTAlphaAnimation animationWithView:self.wakeUpText];
    [self.animator addAnimation:firstScreenWakeUpAnimation];
    [firstScreenWakeUpAnimation addKeyFrames:@[
                                   [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f],
                                   [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                   ]];
    
    IFTTTAlphaAnimation *firstScreenwelcomeAnimation = [IFTTTAlphaAnimation animationWithView:self.welcome];
    [self.animator addAnimation:firstScreenwelcomeAnimation];
    [firstScreenwelcomeAnimation addKeyFrames:@[
                                               [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f],
                                               [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                               ]];
    
    IFTTTAlphaAnimation *firstScreentoAnimation = [IFTTTAlphaAnimation animationWithView:self.flowers];
    [self.animator addAnimation:firstScreentoAnimation];
    [firstScreentoAnimation addKeyFrames:@[
                                                [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f],
                                                [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                                ]];
    
    IFTTTAlphaAnimation *firstScreenworldAnimation = [IFTTTAlphaAnimation animationWithView:self.worldText];
    [self.animator addAnimation:firstScreenworldAnimation];
    [firstScreenworldAnimation addKeyFrames:@[
                                           [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f],
                                           [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                           ]];
    
    IFTTTAlphaAnimation *firstScreenbigTopBarAnimation = [IFTTTAlphaAnimation animationWithView:self.bigTopBar];
    [self.animator addAnimation:firstScreenbigTopBarAnimation];
    [firstScreenbigTopBarAnimation addKeyFrames:@[
                                              [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f],
                                              [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                              ]];
    
    IFTTTAlphaAnimation *firstScreenbigBottomBarAnimation = [IFTTTAlphaAnimation animationWithView:self.bigBottomBar];
    [self.animator addAnimation:firstScreenbigBottomBarAnimation];
    [firstScreenbigBottomBarAnimation addKeyFrames:@[
                                                  [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:1.0f],
                                                  [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                                  ]];
    
    IFTTTAlphaAnimation *thirdScreenButtonOneBarAnimation = [IFTTTAlphaAnimation animationWithView:self.buttonOne];
    [self.animator addAnimation:thirdScreenButtonOneBarAnimation];
    [thirdScreenButtonOneBarAnimation addKeyFrames:@[
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:0.0f],
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andAlpha:1.0f],
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:0.0f],
                                                     ]];
    
    IFTTTAlphaAnimation *thirdScreenButtonTwoBarAnimation = [IFTTTAlphaAnimation animationWithView:self.buttonTwo];
    [self.animator addAnimation:thirdScreenButtonTwoBarAnimation];
    [thirdScreenButtonTwoBarAnimation addKeyFrames:@[
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:0.0f],
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:0.0f],
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(3) andAlpha:1.0f],
                                                     [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:0.0f],
                                                     ]];
    
    
//    andFrame:CGRectOffset(CGRectInset(self.introClock.frame, 50, 50), self.view.frame.size.width *2, 0)],
    // now, we animate the unicorn
//    IFTTTFrameAnimation *clockAnimation = [IFTTTFrameAnimation animationWithView:self.introClock];
//    [self.animator addAnimation:clockAnimation];
//    
//    [clockAnimation addKeyFrames:@[
//                                   [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:CGRectOffset(self.introClock.frame, 0, 0)],
//                                   [IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:CGRectOffset(CGRectInset(self.introClock.frame, 50, 50), self.view.frame.size.width, 20)],
//                                   ]];
//                
//    [clockAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(1) andFrame:self.clock.frame]];
//    [clockAnimation addKeyFrame:[IFTTTAnimationKeyFrame keyFrameWithTime:timeForPage(2)
//                                                                       andFrame:CGRectOffset(CGRectInset(self.clock.frame, ds, ds), timeForPage(2), 240)]];
    
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
