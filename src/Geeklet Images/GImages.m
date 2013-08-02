//
//  GImages.m
//  Geeklet Images
//
//  Created by James Parker on 8/1/13.
//

#import "GImages.h"

#define DIMENSIONS 128.0
#define WEIGHT 4.0

@implementation GImages

+(NSImage *) generateImage:(NSInteger) percent {
    NSSize size = NSMakeSize( DIMENSIONS, DIMENSIONS);
    NSImage *img = [[ NSImage alloc ] initWithSize:size ];
    
    [ img lockFocus ];
    
    NSColor *color = [ NSColor colorWithDeviceRed:148.0 green:160.0 blue:166.0 alpha:0.9 ];
    // Fix for case when percent is 0.
    if ( percent == 0) {
        color = [ NSColor colorWithDeviceRed:148.0 green:160.0 blue:166.0 alpha:.25 ];
        percent = 50;
    }
    
    [ color set ];
    
    NSBezierPath *path = [ NSBezierPath bezierPath ];
    
    CGFloat midAngle = (90.0 - 3.6 * percent);
    
    [ path appendBezierPathWithArcWithCenter:NSMakePoint( size.width / 2.0, size.height / 2.0) radius:(DIMENSIONS / 2.0 - WEIGHT / 2.0) startAngle:90.0 endAngle:midAngle clockwise:YES ];
    
    [ path setLineWidth:WEIGHT ];
    [ path setLineCapStyle:NSButtLineCapStyle ];
    [ path stroke ];
    
    color = [ NSColor colorWithDeviceRed:148.0 green:160.0 blue:166.0 alpha:.25 ];
    //color = [ NSColor colorWithDeviceWhite:0.2 alpha:0.9 ];
    [ color set ];
    
    path = [ NSBezierPath bezierPath ];
    [ path appendBezierPathWithArcWithCenter:NSMakePoint( size.width / 2.0, size.height / 2.0) radius:(DIMENSIONS / 2.0 - WEIGHT / 2.0) startAngle:midAngle endAngle:90.0 clockwise:YES ];
    
    [ path setLineWidth:WEIGHT ];
    [ path setLineCapStyle:NSButtLineCapStyle ];
    [ path stroke ];
    
    [ img unlockFocus ];
    
    return img;
}

+(void) writeImage:(NSImage *)img withPercent:(NSInteger) i {
    // NSFileManager *manager = [ NSFileManager defaultManager ];
    NSString *path = @"/Users/james/Documents/Projects/Scripts/GeekTool/img";// [ manager currentDirectoryPath ];
    path = [ NSString stringWithFormat:@"%@/%d.png", path, i ];
    
    NSData *data = [ img TIFFRepresentation ];
    NSBitmapImageRep *rep = [ NSBitmapImageRep imageRepWithData:data ];
    NSDictionary *props = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.0] forKey:NSImageCompressionFactor];
    data = [ rep representationUsingType:NSPNGFileType properties:props ];
    [ data writeToFile:path atomically:NO ];
}

@end
