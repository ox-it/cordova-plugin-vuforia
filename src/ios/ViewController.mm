#import "ViewController.h"
#import "ImageTargetsViewController.h"


@interface ViewController ()

@property BOOL launchedCamera;

@end

@implementation ViewController


-(id)initWithFileName:(NSString *)fileName targetNames:(NSArray *)imageTargetNames customOverlayText:(NSString *)overlayText vuforiaLicenseKey:(NSString *)vuforiaLicenseKey refImageName:(NSString *)refImageName r:(NSString *)r g:(NSString *)g b:(NSString *)b {
    
    self = [super init];
    self.imageTargets = [[NSDictionary alloc] initWithObjectsAndKeys: fileName, @"imageTargetFile", imageTargetNames, @"imageTargetNames", nil];
    self.overlayText = overlayText;
    self.vuforiaLicenseKey = vuforiaLicenseKey;
    self.refImageName = refImageName;
    self.r = r;
    self.g = g;
    self.b = b;
    
    NSLog(@"Vuforia Plugin :: initWithFileName: %@", fileName);
    NSLog(@"Vuforia Plugin :: overlayText: %@", self.overlayText);
    NSLog(@"Vuforia Plugin :: License key: %@", self.vuforiaLicenseKey);
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    NSLog(@"Vuforia Plugin :: viewController did load");
    self.launchedCamera = false;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (self.launchedCamera == false) {
        ImageTargetsViewController *vc = [[ImageTargetsViewController alloc]  initWithOverlayText:self.overlayText vuforiaLicenseKey:self.vuforiaLicenseKey refImageName:self.refImageName r:self.r g:self.g b:self.b];
        self.launchedCamera = true;
        
        vc.imageTargetFile = [self.imageTargets objectForKey:@"imageTargetFile"];
        vc.imageTargetNames = [self.imageTargets objectForKey:@"imageTargetNames"];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissMe {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CameraHasFound" object:self];
}

@end
