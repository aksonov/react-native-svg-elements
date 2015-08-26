//
//  RCTSvgRect.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 25.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgRect.h"
#import "UIView+React.h"

@implementation RCTSvgRect

-(NSDictionary *)objParams {
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[self asAttributes]];
    if (self.scale){
        map[@"transform"] = [NSString stringWithFormat:@"scale(%@)", self.scale];
    }
    return @{kAttributesElementName: map, kElementName: @"rect"};
}
+(CGSize) currentSize
{
    return [RCTSvgRect sizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

+(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIApplication *application = [UIApplication sharedApplication];
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        size = CGSizeMake(size.height, size.width);
    }
    if (application.statusBarHidden == NO)
    {
        size.height -= MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
    }
    return size;
}
-(SVGAttributedObject *)obj {
    self.userInteractionEnabled = NO;
    
    GHRenderableObject *o = super.obj;
    if (!o){
        GHRectangle *rect = [[GHRectangle alloc] initWithDictionary:[self objParams]];
        super.obj = rect;
        [self setNeedsDisplay];
    }
    return super.obj;
}
@end
