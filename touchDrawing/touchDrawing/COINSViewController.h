//
//  COINSViewController.h
//  touchDrawing
//
//  Created by Shimizu Keiichi on 2013/11/21.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface COINSViewController : UIViewController{
    GLuint vertexBufferID;
    GLuint gridBufferID;
}
@property (strong, nonatomic) GLKBaseEffect *baseEffect;

- (IBAction)tapAction:(id)sender;
- (IBAction)rulerButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet GLKView *glview;


@end
