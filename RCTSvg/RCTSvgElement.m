//
//  RCTSvgElement.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgElement.h"
#import "RCTSvgDynamicRenderer.h"
#import "RCTSvg.h"

@implementation RCTSvgElement

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.contentMode = UIViewContentModeRedraw;
    self.backgroundColor = [UIColor clearColor];
    self.x = 0;
    self.y = 0;
    return self;
}

-(NSDictionary *__nullable)objParams {
    return nil;
}

- (void)drawRect:(CGRect)rect {
    UIView *view = self;
    while (view.superview && ![view.superview isKindOfClass:[RCTSvg class]]){
        view = view.superview;
    }
    RCTSvg *superview = (RCTSvg *)view.superview;
    RCTSvgDynamicRenderer *renderer = superview.renderer ? superview.renderer : [RCTSvgDynamicRenderer sharedInstace];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM (context, self.y, self.x);
    [self.obj renderIntoContext:context withSVGContext:renderer];
}

+(NSDictionary *__nullable)objParams:(NSString *)name object:(id)obj{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[obj asAttributes]];
    if (map[@"scale"]){
        if (map[@"transform"]){
            map[@"transform"] = [NSString stringWithFormat:@"scale(%@) %@",map[@"scale"],map[@"transform"]];
        } else
            map[@"transform"] = [NSString stringWithFormat:@"scale(%@)", map[@"scale"]];
    }
    return @{kAttributesElementName: map, kElementName: name};
    
}
@end
