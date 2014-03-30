//
//  AlarmLabelEditViewController.h
//  AlarmClock
//


#import <UIKit/UIKit.h>

@class AlarmLabelEditViewController;

@protocol AlarmLabelEditViewControllerDelegate <NSObject>
- (void)updateLabelText:(NSString*)newLabel;
@end

@interface AlarmLabelEditViewController : UIViewController<UITextFieldDelegate>{
    UITextField * labelField;
}

@property (nonatomic, strong) IBOutlet UITableView *tableAlarmView;
@property (nonatomic, strong) NSString * label;
@property(unsafe_unretained) id <AlarmLabelEditViewControllerDelegate> delegate;

@end
