//
//  JSObjectMethods.h
//  OC-JS
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSObjectMethods <JSExport>

//传name
- (void)loginApp:(NSString*)name;
//传name password
- (void)logintest:(NSString*)name :(NSString*)password;
//alert
- (void)showAlertView;
@end
