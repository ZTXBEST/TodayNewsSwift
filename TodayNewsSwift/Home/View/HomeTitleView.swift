//
//  HomeTitleView.swift
//  
//
//  Created by 赵天旭 on 2017/11/3.
//

import UIKit

class HomeTitleView: UIView {
    
    var titles : [TitleModel]? {
        didSet {
            initTitleLabels()
            setupTitleLabelsFrame()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //滚动视图
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: KScreenWidth-40, height: 40))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    
    /// 标题数组
    fileprivate lazy var titleLabels = [UILabel]()
    
    fileprivate lazy var currentIndex : Int = 0
    
    /// 底部滑动指示器
    fileprivate lazy var bottomLineView : UIView = {
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = TXColor(r: 210, g: 63, b: 66, a: 1)
        bottomLineView.height = 2
        bottomLineView.y = 37
        return bottomLineView
    }()
    
    /// 底部分割线
    fileprivate lazy var separatorLineView: UIView = {
        let separatorLineView = UIView(frame: CGRect(x: 0, y: 39, width: KScreenWidth, height: 1))
        separatorLineView.backgroundColor = UIColor(red: 230, green: 230, blue: 230, alpha: 1)
        return separatorLineView
    }()
    
    fileprivate lazy var rightButton : UIButton = {
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: KScreenWidth - 40, y: 0, width: 40, height: 40)
                rightButton.setImage(UIImage(named: "add_channel_titlbar_thin_new_16x16_"), for: .normal)
//        rightButton.theme_setImage("images.addChannelTitlbar", forState: .normal) rightButton.theme_setBackgroundImage("images.shadowAddTitlebar", forState: .normal)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return rightButton
    }()
}

/// UI
extension HomeTitleView {
    func initView() {
        addSubview(scrollView)
        addSubview(separatorLineView)
        addSubview(rightButton)
        scrollView.addSubview(bottomLineView)
    }
    
    fileprivate func initTitleLabels() {
        for (index,topTitle) in (titles?.enumerated())! {
            let titleLabel = UILabel()
            titleLabel.text = topTitle.name
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.tag = index
            titleLabel.textAlignment = .center
            scrollView.addSubview(titleLabel)
            titleLabels.append(titleLabel)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
            titleLabel.addGestureRecognizer(tapGesture)
            titleLabel.isUserInteractionEnabled = true
        }
    }
    
    fileprivate func setupTitleLabelsFrame() {
        for (i,titleLabel) in titleLabels.enumerated() {
            let model = titles![i]
            var width : CGFloat = 0
            let height : CGFloat = 40
            var x : CGFloat = 0
            let y : CGFloat = 0
            let margin : CGFloat = 15.0//左右间距
            
            width = (model.name! as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : titleLabel.font], context: nil).width
            if i==0 {
                x = margin * 0.5
                bottomLineView.x = x
                bottomLineView.width = width
            }
            else {
                let label = titleLabels[i-1]
                x = label.frame.maxX + margin
            }
            titleLabel.frame = CGRect(x: x, y: y, width: width, height: height)
            scrollView.contentSize = CGSize(width: titleLabels.last!.frame.maxX + margin * 0.5, height: 0)
        }
    }
}


// MARK: - 监听事件
extension HomeTitleView {
    @objc fileprivate func titleLabelClick(_ tapGesture : UITapGestureRecognizer) {
        
        /// 取出用户点击的label
        let label = tapGesture.view
        adjustLabel(index: (label?.tag)!)
    }
    
    fileprivate func adjustLabel(index : Int) {
        
        if currentIndex == index {
            return
        }
        for label in titleLabels {
            label.textColor = UIColor.black
        }
        let sourceLabel = titleLabels[index]
        sourceLabel.textColor = globalRedColor()
        
        currentIndex = index
        
        UIView.animate(withDuration: 0.25, animations: {
            self.bottomLineView.width = sourceLabel.width
            self.bottomLineView.centerX = sourceLabel.centerX
        })
        
        /// 改变偏移量
        var offsetX = sourceLabel.centerX - scrollView.width/2
        if offsetX<0 {
            offsetX=0
        }
        
        /// 最大偏移量
        var maxOffsetX = scrollView.contentSize.width - scrollView.width
        if maxOffsetX<0 {
            maxOffsetX=0
        }
        
        if offsetX>maxOffsetX {
            offsetX=maxOffsetX
        }
        
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    @objc fileprivate func rightButtonClicked() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HomeTitleLabelAddBtnClick"), object: titles)
    }
    
}

