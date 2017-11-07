
//
//  HomeViewController.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/6.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40;


class HomeViewController: UIViewController {

    //MARK -- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH);
        let titles = ["推荐","游戏","娱乐","趣玩"];
        let titleView = PageTitleView(frame: titleFrame, titles: titles);
        return titleView;
    }()
    
    fileprivate lazy var pageContentView : PageContentView = {
        //1.确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH;
        let contentFrame  = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        //2、确定所有的子控制器
        var childVcs = [UIViewController]();
        for _ in 0..<4 {
            let vc = UIViewController();
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)));
            childVcs.append(vc);
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self);
        return contentView;
    }()
    
    //mark -- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI();
    }
}

//设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        //0、不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false;
        
        //1、设置导航栏
        setupNavigationBar();
        
        //2.添加TitleView
        view.addSubview(pageTitleView);
        
        //3、添加contentView
        view.addSubview(pageContentView);
    }
    
    private func setupNavigationBar() {
        //1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo");
        
        //2.设置右侧的Item
        let size = CGSize(width: 40, height: 40);

        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size);
        let serchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size);
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size);
    
        navigationItem.rightBarButtonItems = [historyItem,serchItem,qrcodeItem];
    }
    

}
