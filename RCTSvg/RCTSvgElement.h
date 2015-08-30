//
//  RCTSvgElement.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHRenderable.h"
#import "SVGAttributedObject.h"
#import "NSObject+Serialize.h"
#import "RCTSvgDynamicRenderer.h"
#import "RCTUtils.h"
#import "RCTShadowView.h"

@interface RCTSvgElement : UIView

// underlying SVG element (if any) for rendering or future reference
@property (nonatomic, strong) id __nullable obj;
@property (nonatomic) float x;
@property (nonatomic) float y;
-(void)prepare;
-(NSDictionary *__nullable)objParams;

+(NSDictionary *__nullable)objParams:(NSString *__nonnull)name object:(id __nonnull)obj;


@end
