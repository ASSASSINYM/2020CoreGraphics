//
//  WaveViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/18.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "WaveViewController.h"
#import "MTWave.h"

@interface WaveViewController ()

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MTWave *wave = [[MTWave alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300)];
    wave.backgroundColor = [UIColor greenColor];
    [self.view addSubview:wave];
    
    [wave startWaveAnimation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
