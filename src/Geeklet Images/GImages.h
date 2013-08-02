//
//  GImages.h
//  Geeklet Images
//
//  Created by James Parker on 8/1/13.
//  Copyright (c) 2013 university of md college park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface GImages : NSObject
+(NSImage *) generateImage:(NSInteger) percent;
+(void) writeImage:(NSImage *)img withPercent:(NSInteger) i;
@end
