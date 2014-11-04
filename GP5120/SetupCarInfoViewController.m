//
//  SetupCarInfoViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-3.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "SetupCarInfoViewController.h"

@interface SetupCarInfoViewController ()

@end

@implementation SetupCarInfoViewController

@synthesize _mainScrollView;

@synthesize _homeInfoModel;

@synthesize _transportType;

@synthesize _transportTypeOneButton;

@synthesize _transportTypeTwoButton;

@synthesize _takeOneButton;

@synthesize _takeTwoButton;

@synthesize _takeThreeButton;

@synthesize _takeFourButton;

@synthesize _boxType;

@synthesize _pack_date;

@synthesize _datePicker;

@synthesize _portTextField;

@synthesize _boxTextField;

@synthesize _weightField;

@synthesize _phoneField;

@synthesize _peopleField;

@synthesize _destinationField;

@synthesize _otherField;

@synthesize _priceField;

@synthesize _priceButton;

@synthesize _price;

@synthesize _boxInfo;

@synthesize _pickerView;

@synthesize _keyboardDoneButtonView;

@synthesize _addCarInfoType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"发布派车信息";
        
        UIImage *backImage = [UIImage imageNamed:@"releasesuccess_return"];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        leftButton.frame = CGRectMake(0.0, 0.0, 42.0, 25.0);
        
        [leftButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton setBackgroundImage:backImage forState:UIControlStateNormal];
        
        UIBarButtonItem *leftBarButonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        self.navigationItem.leftBarButtonItem = leftBarButonItem;        
        
    }
    return self;
}

-(void)loadView{
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    [mainView setBackgroundColor:[UIColor whiteColor]];
    
    self.view =  mainView;
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height-54-49)];
    
    [_mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 568-64-49)];
    
    [self.view addSubview:_mainScrollView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _transportType = @"进口";
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    _pack_date = [NSString stringWithFormat:@"%@",
                  [formatter stringFromDate:date]];
    
    _price=@"";
    
    _boxInfo = [NSArray arrayWithObjects:@"20小柜",@"40大柜", nil];
    
    NSLog(@"%@",_homeInfoModel);
    
    UIImage *topImage = [UIImage imageNamed:@"putout_picture"];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 37)];
    
    [topImageView setImage:topImage];
    
    [_mainScrollView addSubview:topImageView];
    
    UILabel *portLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.0, topImageView.frame.origin.y+topImageView.frame.size.height+10.0, 55.0, 20.0)];
    
    [portLabel setText:@"港口:"];
    
    [_mainScrollView addSubview:portLabel];
    
    _portTextField = [[UITextField alloc] initWithFrame:CGRectMake(portLabel.frame.origin.x+portLabel.frame.size.width, portLabel.frame.origin.y, 175.0, 20.0)];
    
    [_portTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _portTextField.placeholder = @"青岛港";
    
    _portTextField.delegate = self;
    
    _portTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _portTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _portTextField.returnKeyType = UIReturnKeyDone;
    
    _portTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _portTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_portTextField];
    
    UIImage *portButtonImage = [UIImage imageNamed:@"putout_middle"];
    
    UIButton *portButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [portButton setFrame:CGRectMake(_portTextField.frame.origin.x+_portTextField.frame.size.width, portLabel.frame.origin.y, 30.0, 20.0)];
    
    [portButton setBackgroundImage:portButtonImage forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:portButton];
    
    UILabel *transportTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(portLabel.frame.origin.x, portLabel.frame.origin.y+portLabel.frame.size.height+10.0, 85.0, 20.0)];
    
    [transportTypeLabel setText:@"运输类型："];
    
    [_mainScrollView addSubview:transportTypeLabel];
    
    _transportTypeOneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_transportTypeOneButton setFrame:CGRectMake(transportTypeLabel.frame.origin.x+transportTypeLabel.frame.size.width, transportTypeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    _transportTypeOneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_transportTypeOneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _transportTypeOneButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [_transportTypeOneButton setTitle:@"进口" forState:UIControlStateNormal];
    
    _transportTypeOneButton.tag = 40;
    
    [_transportTypeOneButton addTarget:self action:@selector(transportType:) forControlEvents:UIControlEventTouchUpInside];
    
    [_transportTypeOneButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_transportTypeOneButton];
    
    _transportTypeTwoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_transportTypeTwoButton setFrame:CGRectMake(_transportTypeOneButton.frame.origin.x+_transportTypeOneButton.frame.size.width+5.0, transportTypeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    _transportTypeTwoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_transportTypeTwoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _transportTypeTwoButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    _transportTypeTwoButton.tag = 41;
    
    [_transportTypeTwoButton addTarget:self action:@selector(transportType:) forControlEvents:UIControlEventTouchUpInside];
    
    [_transportTypeTwoButton setTitle:@"出口" forState:UIControlStateNormal];
    
    [_transportTypeTwoButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_transportTypeTwoButton];
    
    UILabel *boxTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(transportTypeLabel.frame.origin.x, transportTypeLabel.frame.origin.y+transportTypeLabel.frame.size.height+10.0, 55.0, 20.0)];
    
    [boxTypeLabel setText:@"箱型："];
    
    [_mainScrollView addSubview:boxTypeLabel];
    
    _boxTextField = [[UITextField alloc] initWithFrame:CGRectMake(boxTypeLabel.frame.origin.x+boxTypeLabel.frame.size.width, boxTypeLabel.frame.origin.y, 175.0, 20.0)];
    
    [_boxTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _boxTextField.placeholder = @"20小柜";
    
    _boxTextField.delegate = self;
    
    _boxTextField.tag = 50;
    
    _boxTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _boxTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _boxTextField.returnKeyType = UIReturnKeyDone;
    
    _boxTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _boxTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_boxTextField];
    
    UILabel *weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(boxTypeLabel.frame.origin.x, boxTypeLabel.frame.origin.y+boxTypeLabel.frame.size.height+10.0, 55.0, 20.0)];
    
    [weightLabel setText:@"重量："];
    
    [_mainScrollView addSubview:weightLabel];
    
    _weightField = [[UITextField alloc] initWithFrame:CGRectMake(weightLabel.frame.origin.x+weightLabel.frame.size.width, weightLabel.frame.origin.y, 60.0, 20.0)];
    
    [_weightField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _weightField.placeholder = @"13";
    
    _weightField.delegate = self;
    
    _weightField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _weightField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _weightField.returnKeyType = UIReturnKeyDone;
    
    _weightField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _weightField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_weightField];
    
    UILabel *weightEndLabel = [[UILabel alloc] initWithFrame:CGRectMake(_weightField.frame.origin.x+_weightField.frame.size.width+3, _weightField.frame.origin.y, 30.0, 20.0)];
    
    [weightEndLabel setText:@"吨"];
    
    [_mainScrollView addSubview:weightEndLabel];
    
    UIImage *meddleImage = [UIImage imageNamed:@"putout_top_picture"];
    
    UIImageView *meddleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, weightLabel.frame.origin.y+weightLabel.frame.size.height+5.0, self.view.frame.size.width, 15)];
    
    [meddleImageView setImage:meddleImage];
    
    [_mainScrollView addSubview:meddleImageView];
    
    UILabel *takeTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(weightLabel.frame.origin.x, meddleImageView.frame.origin.y+meddleImageView.frame.size.height+10.0, 85.0, 20)];
    
    [takeTimeLabel setText:@"提货时间："];
    
    [_mainScrollView addSubview:takeTimeLabel];
    
    _takeOneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_takeOneButton setFrame:CGRectMake(takeTimeLabel.frame.origin.x+takeTimeLabel.frame.size.width, takeTimeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    _takeOneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_takeOneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _takeOneButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [_takeOneButton setTitle:@"今天" forState:UIControlStateNormal];
    
    _takeOneButton.tag = 42;
    
    [_takeOneButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_takeOneButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_takeOneButton];
    
    _takeTwoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_takeTwoButton setFrame:CGRectMake(_takeOneButton.frame.origin.x+_takeOneButton.frame.size.width+5.0, takeTimeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    _takeTwoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_takeTwoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _takeTwoButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [_takeTwoButton setTitle:@"明天" forState:UIControlStateNormal];
    
    _takeTwoButton.tag = 43;
    
    [_takeTwoButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_takeTwoButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_takeTwoButton];
    
    _takeThreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_takeThreeButton setFrame:CGRectMake(_takeTwoButton.frame.origin.x+_takeTwoButton.frame.size.width+5.0, takeTimeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    _takeThreeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_takeThreeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _takeThreeButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [_takeThreeButton setTitle:@"后天" forState:UIControlStateNormal];
    
    _takeThreeButton.tag = 44;
    
    [_takeThreeButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_takeThreeButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_takeThreeButton];
    
    _takeFourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_takeFourButton setFrame:CGRectMake(_takeOneButton.frame.origin.x, takeTimeLabel.frame.origin.y+takeTimeLabel.frame.size.height+5.0,100.0, 15.0)];
    
    _takeFourButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_takeFourButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _takeFourButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [_takeFourButton setTitle:@"其他时间" forState:UIControlStateNormal];
    
    _takeFourButton.tag = 45;
    
    [_takeFourButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_takeFourButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_takeFourButton];
    
    UILabel *phoneLable = [[UILabel alloc] initWithFrame:CGRectMake(takeTimeLabel.frame.origin.x, _takeFourButton.frame.origin.y+_takeFourButton.frame.size.height+10.0, 85.0, 20)];
    
    [phoneLable setText:@"联系方式："];
    
    [_mainScrollView addSubview:phoneLable];
    
    _phoneField = [[UITextField alloc] initWithFrame:CGRectMake(phoneLable.frame.origin.x+phoneLable.frame.size.width, phoneLable.frame.origin.y, 143.0, 20.0)];
    
    [_phoneField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _phoneField.placeholder = @"13789067543";
    
    _phoneField.delegate = self;
    
    _phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _phoneField.returnKeyType = UIReturnKeyDone;
    
    _phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _phoneField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_phoneField];
    
    UILabel *pepleLable = [[UILabel alloc] initWithFrame:CGRectMake(phoneLable.frame.origin.x, phoneLable.frame.origin.y+phoneLable.frame.size.height+10.0, 75.0, 20)];
    
    [pepleLable setText:@"联系人："];
    
    [_mainScrollView addSubview:pepleLable];
    
    _peopleField = [[UITextField alloc] initWithFrame:CGRectMake(pepleLable.frame.origin.x+pepleLable.frame.size.width, pepleLable.frame.origin.y, 153.0, 20.0)];
    
    [_peopleField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _peopleField.placeholder = @"马先生";
    
    _peopleField.delegate = self;
    
    _peopleField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _peopleField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _peopleField.returnKeyType = UIReturnKeyDone;
    
    _peopleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _peopleField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_peopleField];
    
    UILabel *destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(pepleLable.frame.origin.x, pepleLable.frame.origin.y+pepleLable.frame.size.height+10.0, 75.0, 20.0)];
    
    [destinationLabel setText:@"目的地:"];
    
    [_mainScrollView addSubview:destinationLabel];
    
    _destinationField = [[UITextField alloc] initWithFrame:CGRectMake(destinationLabel.frame.origin.x+destinationLabel.frame.size.width, destinationLabel.frame.origin.y, 155.0, 20.0)];
    
    [_destinationField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _destinationField.placeholder = @"青岛港";
    
    _destinationField.delegate = self;
    
    _destinationField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _destinationField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _destinationField.returnKeyType = UIReturnKeyDone;
    
    _destinationField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _destinationField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_destinationField];
    
    UIImage *destinationButtonImage = [UIImage imageNamed:@"putout_middle"];
    
    UIButton *destinationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [destinationButton setFrame:CGRectMake(_destinationField.frame.origin.x+_destinationField.frame.size.width, destinationLabel.frame.origin.y, 30.0, 20.0)];
    
    [destinationButton setBackgroundImage:destinationButtonImage forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:destinationButton];
    
    UILabel *ohterLabel = [[UILabel alloc] initWithFrame:CGRectMake(destinationLabel.frame.origin.x, destinationLabel.frame.origin.y+destinationLabel.frame.size.height+10.0, 85.0, 20)];
    
    [ohterLabel setText:@"其他说明："];
    
    [_mainScrollView addSubview:ohterLabel];
    
    _otherField = [[UITextField alloc] initWithFrame:CGRectMake(ohterLabel.frame.origin.x+ohterLabel.frame.size.width, ohterLabel.frame.origin.y, 143.0, 20.0)];
    
    [_otherField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _otherField.placeholder = @"点此输入其他说明信息";
    
    _otherField.delegate = self;
    
    _otherField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _otherField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _otherField.returnKeyType = UIReturnKeyDone;
    
    _otherField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _otherField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_otherField];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(ohterLabel.frame.origin.x, ohterLabel.frame.origin.y+ohterLabel.frame.size.height+10.0, 55.0, 20.0)];
    
    [priceLabel setText:@"价格："];
    
    [_mainScrollView addSubview:priceLabel];
    
    _priceField = [[UITextField alloc] initWithFrame:CGRectMake(priceLabel.frame.origin.x+priceLabel.frame.size.width, priceLabel.frame.origin.y, 120.0, 20.0)];
    
    [_priceField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _priceField.placeholder = @"点此输入价格";
    
    _priceField.delegate = self;
    
    _priceField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _priceField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _priceField.returnKeyType = UIReturnKeyDone;
    
    _priceField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _priceField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:_priceField];
    
    _priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_priceButton setFrame:CGRectMake(_priceField.frame.origin.x+_priceField.frame.size.width+5.0, priceLabel.frame.origin.y+5.0,80.0, 15.0)];
    
    _priceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [_priceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _priceButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [_priceButton setTitle:@"电议/面议" forState:UIControlStateNormal];
    
    [_priceButton addTarget:self action:@selector(getPriceType) forControlEvents:UIControlEventTouchUpInside];
    
    [_priceButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:_priceButton];
    
    UIImage *infoImage = [UIImage imageNamed:@"putout_foot_picture"];
    
    UIImageView *infoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(priceLabel.frame.origin.x, priceLabel.frame.origin.y+priceLabel.frame.size.height+10.0, 56, 12)];
    
    [infoImageView setImage:infoImage];
    
    [_mainScrollView addSubview:infoImageView];
    
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [commitButton setFrame:CGRectMake(priceLabel.frame.origin.x, infoImageView.frame.origin.y+infoImageView.frame.size.height+10.0, 104, 32)];
    
    [commitButton setBackgroundImage:[UIImage imageNamed:@"putout_foot_1"] forState:UIControlStateNormal];
    
    [commitButton addTarget:self action:@selector(successCommit:) forControlEvents:UIControlEventTouchUpInside];
    
    [_mainScrollView addSubview:commitButton];
    
    UIButton *commitOtherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [commitOtherButton setFrame:CGRectMake(commitButton.frame.origin.x+commitButton.frame.size.width+20, commitButton.frame.origin.y, 131, 32)];
    
    [commitOtherButton setBackgroundImage:[UIImage imageNamed:@"putout_foot_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:commitOtherButton];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,self.view.frame.size.height-49-54, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];
    
    // Do any additional setup after loading the view.
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    [self inputEnd];
    
    return YES;
    
}

-(void)transportType:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    [_transportTypeOneButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_transportTypeTwoButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    if (button.tag == 40) {
        
        _transportType = @"进口";
        
        [_transportTypeOneButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];

    }else if(button.tag == 41){
        
        [_transportTypeTwoButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
        _transportType = @"出口";
        
    }
    
}

-(void)activeButton:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    [_takeOneButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    [_takeTwoButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    [_takeThreeButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    [_takeFourButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    if (button.tag == 42) {
        
        [button setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        _pack_date = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }else if(button.tag == 43){
        
        [button setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
        
        NSTimeInterval timer = 24 * 60 * 60;
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:timer];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        _pack_date = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }else if(button.tag == 44){
        
        [button setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
        
        NSTimeInterval timer = 24 * 60 * 60 * 24;
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:timer];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        _pack_date = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }else if(button.tag == 45){
        
        [button setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
        
        [self showDataPicker];
        
    }
}

-(void)getPriceType{
    
    if([_price isEqualToString:@"电议/面议"]){
        [_priceButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
        _price = _priceField.text;
    }else{
        [_priceButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
        _price=@"电议/面议";
    }
    
    NSLog(@"%@",_price);
    
}

-(void)showDataPicker{
    
    BOOL isHave=NO;
    
    for (UIView *view in [self.view subviews]){
        
        if ([_datePicker isKindOfClass:view.class]) {
            isHave=YES;
        }
        
    }
    
    if (isHave) {
        _datePicker.hidden=NO;
        [_datePicker setNeedsDisplay];
    }else{
        
        _datePicker = [[DatePickerView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-240+24, self.view.frame.size.width,240)];
        
        [_datePicker setBackgroundColor:[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]];
        
        _datePicker.delegateView = self;
        
        [self.view addSubview:_datePicker];
    }
    
}

-(void)getDatePickerViewData:(NSString *)data{
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"HH:mm:ss"];
    
    _pack_date = [NSString stringWithFormat:@"%@ %@",
                  data,[formatter stringFromDate:date]];
    
    NSLog(@"%@",_pack_date);
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         _datePicker.hidden = YES;
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (![_datePicker isExclusiveTouch]) {
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             _datePicker.hidden = YES;
                             
                         }
                         completion:^(BOOL finished){
                             
                             
                         }];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ((![_portTextField isExclusiveTouch])
        ||(![_boxTextField isExclusiveTouch])||(![_weightField isExclusiveTouch])
        ||(![_phoneField isExclusiveTouch])||(![_peopleField isExclusiveTouch])
        ||(![_destinationField isExclusiveTouch])||(![_otherField isExclusiveTouch])
        ||(![_priceField isExclusiveTouch])
        ) {
        [_portTextField resignFirstResponder];
        [_boxTextField resignFirstResponder];
        [_weightField resignFirstResponder];
        [_phoneField resignFirstResponder];
        [_peopleField resignFirstResponder];
        [_destinationField resignFirstResponder];
        [_otherField resignFirstResponder];
        [_priceField resignFirstResponder];
        
        [self inputEnd];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self inputBegin:textField];
    
    if (textField.tag == 50) {
        
        _pickerView = [[UIPickerView alloc] init];
        
        [_pickerView sizeToFit];
        
        _pickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        
        _pickerView.delegate =self;
        
        _pickerView.dataSource =self;
        
        _pickerView.showsSelectionIndicator =YES;
        
        textField.inputView = _pickerView;
        
        _keyboardDoneButtonView = [[UIToolbar alloc] init];
        
        //keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        
        [_keyboardDoneButtonView setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]];
        
        _keyboardDoneButtonView.translucent =YES;
        
        _keyboardDoneButtonView.tintColor =nil;
        
        [_keyboardDoneButtonView sizeToFit];
        
        NSMutableArray *buttons = [[NSMutableArray alloc] init];
        
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(pickerDoneClicked:)];
        
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        [buttons addObject:flexibleSpace];
        
        [buttons addObject:doneButton];
        
        [_keyboardDoneButtonView setItems:buttons];
        
        textField.inputAccessoryView = _keyboardDoneButtonView;
        
    }
    
    
}

-(void)pickerDoneClicked:(id)sender{

    NSString *data = [NSString stringWithFormat:@"%@",[_boxInfo objectAtIndex:[_pickerView selectedRowInComponent:0]]];
    
    _boxTextField.text = data;
    
    [_keyboardDoneButtonView setHidden:YES];
    
    [_pickerView setHidden:YES];
    
    [_boxTextField resignFirstResponder];
    
    NSLog(@"%@",data);
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //    return 6;
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return _boxInfo.count;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [_boxInfo objectAtIndex:row];
    
}

- (void)inputBegin:(id)sender {
    //这里添加了一个滚动的动画
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.15];
    
    UITextField *textField = (UITextField *)sender;
    //开始编辑的时候，让_scrollView滚到CGPointMake(0, 216);
    
    if ((_mainScrollView.frame.size.height-textField.frame.origin.y-textField.frame.size.height)<216) {
        
        CGPoint offset = CGPointMake(0,216-(_mainScrollView.frame.size.height-textField.frame.origin.y));
        
        [_mainScrollView setContentOffset:offset animated:YES];
        
        [UIView commitAnimations];
    }
    
    
    
}

- (void)inputEnd {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.15];
    //结束编辑的时候，让_scrollView滚到CGPointMake(0, 0);
    CGPoint offset = CGPointMake(0, 0);
    [_mainScrollView setContentOffset:offset animated:YES];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)successCommit:(id)action{
    
    if (![_price isEqualToString:@"电议/面议"]) {
        if ([_price isEqualToString:@""]) {
            _price = _priceField.text;
        }
    }
    
    NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
    
    if ([[userLoginInfo objectForKey:@"password"] isEqualToString:@""]){
        
        LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
        
        [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
        
    }else if ([_portTextField.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"港口不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_transportType isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"箱型不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_boxTextField.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"箱型不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_weightField.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"重量不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_pack_date isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"提货时间不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_phoneField.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"联系方式不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if(![self checkPhoneNumInput:_phoneField.text]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"联系方式不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_peopleField.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"联系人不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_destinationField.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"目的地不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_price isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"价格不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else{
        
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        
        NSString *username = [defaults objectForKey:@"username"];
        
        NSString *carInfoUrl=nil;
        
        if ([_addCarInfoType isEqualToString:@"driver"]) {
            
            carInfoUrl = [NSString stringWithFormat:@"%@&flag=3&username=%@&pub_name=%@&address=%@&contact=%@&ask=%@&pack_date=%@&pack_type=%@&price=%@&mobile_ip=%@&weight=%@&port=%@&tran_type=%@&driver=%@&driver_mobile=%@",SERVER_URL,username,_peopleField.text,_destinationField.text,_phoneField.text,_otherField.text,_pack_date,_boxTextField.text,_price,@"",_weightField.text,_portTextField.text,_transportType,_homeInfoModel.oneField,_homeInfoModel.twoField];
            
        }else if([_addCarInfoType isEqualToString:@"consumer"]){
        
            carInfoUrl = [NSString stringWithFormat:@"%@&flag=2&username=%@&pub_name=%@&address=%@&contact=%@&ask=%@&pack_date=%@&pack_type=%@&price=%@&mobile_ip=%@&weight=%@&port=%@&tran_type=%@",SERVER_URL,username,_peopleField.text,_destinationField.text,_phoneField.text,_otherField.text,_pack_date,_boxTextField.text,_price,@"",_weightField.text,_portTextField.text,_transportType];
        }
        
        NSLog(@"%@",carInfoUrl);
        
        ASIFormDataRequest *carInfoForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:carInfoUrl]];
        
        [carInfoForm startSynchronous];
        
        NSString *result = [carInfoForm responseString];
        
        if ([result isEqualToString:@"0"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"发布失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"1"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"发布失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"2"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不能重复发布" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"3"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"模拟帐号不能发布" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"4"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"被拉入黑名单5天" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"5"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"6"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"信息异常导致发布失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }
        
    }
    
//    SuccessViewController *successViewController = [[SuccessViewController alloc] init];
//    
//    [self.navigationController pushViewController:successViewController animated:YES];
    
}

-(BOOL)checkPhoneNumInput:(NSString *)phone{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phone];
    BOOL res2 = [regextestcm evaluateWithObject:phone];
    BOOL res3 = [regextestcu evaluateWithObject:phone];
    BOOL res4 = [regextestct evaluateWithObject:phone];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
