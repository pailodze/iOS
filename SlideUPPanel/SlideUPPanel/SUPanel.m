//
//  SUPanel.m
//  SlideUPPanel
//
//  Created by Mikheil Pailodze on 9/27/14.
//  Copyright (c) 2014 Mikheil Pailodze. All rights reserved.
//

#import "SUPanel.h"

@implementation SUPanel

@synthesize selfHeight;

-(instancetype) initWithHeight:(double) height {
    
    selfHeight = height; // Used in another methods
    
    
    self  = [super initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, height)]; // initializing UIView at the end of the UIScreen.
    [self setBackgroundColor:[UIColor clearColor]]; // Set transparent background on panel.
    
    
    
    UIToolbar *backgroundTB = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height)]; // Create UIToolbar for transparent blurred background.
    [backgroundTB setBarStyle:UIBarStyleDefault]; // Setting Blurred background.
    [backgroundTB setClipsToBounds:YES]; // disappear lines from toolbar
    [self addSubview:backgroundTB]; // Adding it to the panel background

    //Slide down image(just an image for design)
    UIImageView *downButton = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width / 2) - 8, 3, 16, 16)];
    [downButton setImage:[UIImage imageNamed:@"down"]];
    [self addSubview:downButton];
    // End of slide down image
    
    return self;
    
}


-(void) slideUp {
    
    
    [UIView animateWithDuration:0.5 animations:^{ // Animation
        
        
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - selfHeight, [UIScreen mainScreen].bounds.size.width, selfHeight); // Sliding Up the panel from the end of the UIScreen to up.
        
        
    }]; // End of animation
    
    
    
    
    
}

-(void) slideDown {
    
    
    [UIView animateWithDuration:0.5 animations:^{ // Animation
        
        
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, selfHeight); // Sliding Down the panel from the current state bottom.
        
        
    }]; // End of animation
    
    
    
    
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { // Everytime we drag the finger this event is firing.
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.superview]; // getting Y location of touch event.

  
    
    
    if([UIScreen mainScreen].bounds.size.height - location.y < selfHeight) { // checking if touch Y location is bigger than panel height
    self.frame = CGRectMake(0, location.y, [UIScreen mainScreen].bounds.size.width, selfHeight); // if not move the panel UP/DOWN
    }
    
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { // when we end touching the screen this event is firing.
    
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.superview];
    

    
    
    if([UIScreen mainScreen].bounds.size.height - location.y < selfHeight*(2.5/3.0)) { // determining how much is panel dragged down
    
        [UIView animateWithDuration:0.5 animations:^{
            [self slideDown]; // if drag was big, slide it down to the bottom.

            
        }];
        
    
    } else {
        

        [self slideUp]; // if drag was little, slide it up.


    }
    
   
    
}


@end
