//
//  XiugaiViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/27.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface XiugaiViewController : ViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *firstTextField;
@property (nonatomic, strong) UITextField *secondTextField;
@property (nonatomic, strong) UITextField *thirdTextField;
@property (nonatomic, strong) UIAlertController * alertController;

@end

NS_ASSUME_NONNULL_END
