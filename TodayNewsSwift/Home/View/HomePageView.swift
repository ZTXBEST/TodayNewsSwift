//
//  HomePageView.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/3.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

class HomePageView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    fileprivate var currentIndex: Int = 0
    var childVCs : [HomeTopicVC]? {
        didSet {
            let vc = childVCs![currentIndex]
            vc.view.frame = CGRect(x: 0, y: 0, width: collectionView.width, height: collectionView.height)
            collectionView.reloadData()
        }
    }
    
    var titles: [TitleModel]? {
        didSet {
            titleView.titles = titles
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var titleView : HomeTitleView = {
        let titleView = HomeTitleView()
        return titleView
    }()
    
    /// 用collection做视图容器
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: KScreenWidth, height: KScreenHeight-40-kNavBarHeight)
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        collectionView.scrollsToTop = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        return collectionView
    }()
}

extension HomePageView {
    
    fileprivate func initView() {
        addSubview(titleView)
        addSubview(collectionView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(40)
            make.bottom.equalTo(collectionView.snp.top)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
        
        return cell
    }
}
