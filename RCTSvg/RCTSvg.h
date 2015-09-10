//
//  RCTSvg.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 30.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTSvgDynamicRenderer.h"
@interface RCTSvg : UIView

//@property (nonatomic, readwrite) float width;
//@property (nonatomic, readwrite) float height;
@property (nonatomic, strong) RCTSvgDynamicRenderer *renderer;
@end
