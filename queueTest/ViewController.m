//
//  ViewController.m
//  queueTest
//
//  Created by xupengju on 2018/12/12.
//  Copyright © 2018年 guohongtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.串行+同步，会按顺序执行任务，在进入任务进入现场时就会立即执行。因为是同步并没有开辟线程，都在主线程中执行
//    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"start");
//    dispatch_sync(queue, ^{
//        NSLog(@"1-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_sync(queue, ^{
//        NSLog(@"2-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_sync(queue, ^{
//        NSLog(@"3-------%@", [NSThread currentThread]);
//    });
//    NSLog(@"over");
    
    //2.串行+异步，因为是异步，所以会开辟新线程，并且任务不会立马执行，几个任务会在新的线程依次执行
//    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"start-------%@", [NSThread currentThread]);
//    dispatch_async(queue, ^{
//        NSLog(@"1-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_async(queue, ^{
//        sleep(1);
//        NSLog(@"2-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"3-------%@", [NSThread currentThread]);
//    });
//    NSLog(@"over-------%@", [NSThread currentThread]);
    
    //3.并行+同步，因为是同步，所有没有开辟新的线程。虽然是并行，但是用得时同步，并没有体现出并发性，任务还是一个接着一个执行。因为是同步，任务进入队列时就会执行。
//    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_CONCURRENT);
//    NSLog(@"start");
//    dispatch_sync(queue, ^{
//        NSLog(@"1-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_sync(queue, ^{
//        NSLog(@"2-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_sync(queue, ^{
//        NSLog(@"3-------%@", [NSThread currentThread]);
//    });
//    NSLog(@"over");
    
    //4.并行+异步，因为是异步，会开辟新的线程。加入并行队列时，会开辟多个线程，同时执行任务，不分先后。当开辟的线程任务完成时，可以在继续开启下一个任务。
//    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_CONCURRENT);
//    NSLog(@"start");
//    dispatch_async(queue, ^{
//        NSLog(@"1-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"2-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"3-------%@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"4-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"5-------%@", [NSThread currentThread]);
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"6-------%@", [NSThread currentThread]);
//    });
//    NSLog(@"over");
    
    
//    __block int a = 0;
//    while (a < 5) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            a++;
////            NSLog(@"%@-------%d ----- %p", [NSThread currentThread], a, &a);
//        });
//    }
//    NSLog(@"最终的结果为 %d", a);
    
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue = dispatch_queue_create("com.con", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_async(group, queue, ^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"333333");
//        }
//
//    });
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"23232");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"14145");
//    });
//
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"1111111");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"4444");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"55555");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"1111111");
//    });
//
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"22222");
//    });
    
    
//    dispatch_queue_t queue1 = dispatch_queue_create("dispatchGroupMethod1.queue1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t group1 = dispatch_group_create();
//
//    dispatch_group_async(group1, queue1, ^{
//        dispatch_async(queue1, ^{
//            for (NSInteger i =0; i<3; i++) {
//                sleep(1);
//                NSLog(@"%@-异步任务执行-:%ld --- %@",@"任务1",(long)i, [NSThread currentThread]);
//
//            }
//        });
//    });
//
//
//    dispatch_group_async(group1, queue1, ^{
//        dispatch_async(queue1, ^{
//            for (NSInteger i =0; i<3; i++) {
//                sleep(1);
//                NSLog(@"%@-异步任务执行-:%ld   ----%@",@"任务2",(long)i, [NSThread currentThread]);
//
//            }
//        });
//    });
//
//    //    //等待上面的任务全部完成后，会往下继续执行 （会阻塞当前线程）
//    //    dispatch_group_wait(group1, DISPATCH_TIME_FOREVER);
//
//    //等待上面的任务全部完成后，会收到通知执行block中的代码 （不会阻塞线程）
//    dispatch_group_notify(group1, queue1, ^{
//        NSLog(@"Method1-全部任务执行完成----- %@", [NSThread currentThread]);
//    });
    
//    dispatch_queue_t queue2 = dispatch_queue_create("dispatchGroupMethod2.queue2", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t group2 = dispatch_group_create();
//
//
//    dispatch_group_enter(group2);
//    dispatch_async(queue2, ^{
//        for (NSInteger i =0; i<3; i++) {
//            sleep(1);
//            NSLog(@"%@-异步任务执行-:%ld",@"任务1",(long)i);
//
//        }
//        dispatch_group_leave(group2);
//    });
//    //dispatch_group_wait(group2, DISPATCH_TIME_FOREVER)会阻碍线程，和dispatch_barrier_sync效果一样
////    dispatch_group_wait(group2, DISPATCH_TIME_FOREVER);
//    dispatch_barrier_sync(queue2, ^{
//        NSLog(@"dddd");
//    });
//    NSLog(@"阻碍");
//
//    dispatch_suspend(queue2);
//
//    dispatch_group_enter(group2);
//    dispatch_async(queue2, ^{
//        for (NSInteger i =0; i<3; i++) {
//            sleep(1);
//            NSLog(@"%@-异步任务执行-:%ld",@"任务2",(long)i);
//
//        }
//        dispatch_group_leave(group2);
//    });
//
//    //    //等待上面的任务全部完成后，会往下继续执行 （会阻塞当前线程）
//    //    dispatch_group_wait(group2, DISPATCH_TIME_FOREVER);
//
//    //等待上面的任务全部完成后，会收到通知执行block中的代码 （不会阻塞线程）
//    dispatch_group_notify(group2, queue2, ^{
//        NSLog(@"Method2-全部任务执行完成");
//    });
//
//    dispatch_resume(queue2);
    
    
//    dispatch_apply(5, dispatch_queue_create("con", DISPATCH_QUEUE_CONCURRENT), ^(size_t time) {
//         NSLog(@"第%@次_%@",@(time),[NSThread currentThread]);
//    });
    
//    dispatch_apply(5, dispatch_queue_create("con", DISPATCH_QUEUE_SERIAL), ^(size_t time) {
//        NSLog(@"第%@次_%@",@(time),[NSThread currentThread]);
//    });
}


@end
