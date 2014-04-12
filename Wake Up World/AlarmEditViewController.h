//
//  AlarmLabelEditViewController.h
//  AlarmClock
//


#import <UIKit/UIKit.h>

@class AlarmEditViewController;

@protocol AlarmEditViewControllerDelegate <NSObject>
- (void)updateLabelText:(NSString*)newLabel;
@end

@interface AlarmEditViewController : UIViewController<UITextFieldDelegate> {
    UITextField * labelField;
}

@property (nonatomic, strong) IBOutlet UITableView *tableAlarmView;
@property (nonatomic, strong) NSString * label;
@property(unsafe_unretained) id <AlarmEditViewControllerDelegate> delegate;

@end
