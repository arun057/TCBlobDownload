//
//  ViewController.m
//  BlobDownloaderExample
//
//  Created by Thibault Charbonnier on 18/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - Init


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.sharedDownloadManager = [BlobDownloadManager sharedDownloadManager];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setUrlField:nil];
    [self setDownloadButton:nil];
    [self setCancelButton:nil];
}


#pragma mark - Demo


- (void)download:(id)sender
{
    [self.sharedDownloadManager addDownloadWithURL:self.urlField.text
                                       andDelegate:self];
    [self.urlField resignFirstResponder];
}

- (void)cancelAll:(id)sender
{
    [self.sharedDownloadManager cancelAllDownloadsAndRemoveFiles:YES];
}


#pragma mark - BlobDownloadManager Delegate


- (void)downloader:(BlobDownloader *)blobDownloader
    didReceiveData:(uint64_t)received
           onTotal:(uint64_t)total
{
    // If you stored the BlobDownloader you can retrieve it and update your view
    // with the current progression.
}

- (void)downloadDidFinishWithDownloader:(BlobDownloader *)blobDownloader
{
    // If you stored the BlobDownloader you can retrieve it and update your view
    // when the download has finished.
}

- (void)downloader:(BlobDownloader *)blobDownloader didStopWithError:(NSError *)error
{
    // If you stored the BlobDownloader you can retrieve it and display the error
    // it created.
}

@end