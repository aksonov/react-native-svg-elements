//
//  RCTSvgElement.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgElement.h"
#import "RCTSvgDynamicRenderer.h"

@implementation RCTSvgElement

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.contentMode = UIViewContentModeRedraw;
    self.backgroundColor = [UIColor clearColor];
    self.x = 0;
    self.y = 0;
    return self;
}

-(void)prepare {
    if (!self.obj){
        //
    }
}

-(NSDictionary *__nullable)objParams {
    return nil;
}

-(void)setObj:(id __nullable)obj {
    _obj = obj;
    if ([obj respondsToSelector:@selector(attributes)]){
        if ([((NSDictionary *)[obj attributes]) objectForKey:@"id"]){
            [[RCTSvgDynamicRenderer sharedInstace] addObject:obj forKey:[((NSDictionary *)[obj attributes]) objectForKey:@"id"]];
        }
    }
    
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM (context, self.y, self.x);
    if ([self.obj conformsToProtocol:@protocol(GHRenderable)]){
        [((id<GHRenderable>)self.obj) renderIntoContext:context withSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
        
    }
    
//    CGAffineTransform transform = CGAffineTransformMakeTranslation(20, 20);
//    return CGPathCreateCopyByTransformingPath(result, &transform);

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
