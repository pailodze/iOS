//
//  SUPanel.h
//  SlideUPPanel
//
//  Created by Mikheil Pailodze on 9/27/14.
//  Copyright (c) 2014 Mikheil Pailodze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUPanel : UIView

@property (nonatomic) double selfHeight;

-(instancetype) initWithHeight:(double) height;
-(void) slideUp;
-(void) slideDown;
@end
