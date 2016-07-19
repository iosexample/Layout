//
//  CustomView.swift
//  Layout
//
//  Created by Don on 16/7/19.
//
//

import UIKit

@IBDesignable class CustomView: UIView {
    var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
//        view.frame.size.width = UIScreen.mainScreen().bounds.size.width
        //        let width = 418.0 * CGRectGetWidth(UIScreen.mainScreen().bounds) / 750.0;
        //        self.frame.size = CGSizeMake(width, width);
        
        // Make the view stretch with containing view
//        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        view.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        
//        let constW = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: UIScreen.mainScreen().bounds.size.width)
//        self.addConstraint(constW);
//        let constH = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200)
//        self.addConstraint(constH);
        
        let constT = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0);
        self.addConstraint(constT);
        
        let constL = NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1, constant: 0);
        self.addConstraint(constL);
        
        let constR = NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1, constant: 0);
        self.addConstraint(constR);
        
        let constB = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: 0);
        self.addConstraint(constB);
        
        customize()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    
    func customize() {
        backgroundColor = .blueColor()
    }
    
//    override func intrinsicContentSize() -> CGSize {
//        return CGSize(width: 200, height: 100)
//    }
}
