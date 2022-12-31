//
//  PhotoViewController.h
//  3.3Gshare
//
//  Created by 翟旭博 on 2022/7/26.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoDelegate <NSObject>

- (void)changephoto:(NSString *) str:(int)num  ;

@end

@interface PhotoViewController : ViewController

@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSMutableString *str;

@property (assign, nonatomic) id<PhotoDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
