//
//  main.m
//  Geeklet Images
//
//  Created by James Parker on 8/1/13.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "GImages.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        for ( NSInteger i = 0; i <= 100; i++) {
            NSImage *img = [ GImages generateImage:i ];
            
            [ GImages writeImage:img withPercent:i ];
        }
        
    }
    return 0;
}

