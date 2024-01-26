//
//  UICollectionView+ContentHeight.swift
//  Extension
//
//  Created by 杨雄凯 on 2023/10/25.
//

import UIKit

public extension UICollectionView {
    
    /// 类方法获取内容的高度，前提是所有的cell的高度固定且一致，此方法一般适用于tableViewCell中嵌套collectionView且item全部铺开时计算当前cell的高度
    /// - Parameters:
    ///   - itemCountInSingleLine: 单行item的数量
    ///   - itemHeight: item高度
    ///   - itemCount: item数量
    ///   - itemSpacingVertical: item纵向间距
    ///   - sectionInsetTop: layout上边距
    ///   - sectionInsetBottom: layout下边距
    ///   - headerHeight: header高度
    ///   - footerHeight: footer高度
    /// - Returns: 内容高度
    static func contentHeight(itemCountInSingleLine: Int,
                              itemHeight: CGFloat,
                              itemCount: Int,
                              itemSpacingVertical: CGFloat,
                              sectionInsetTop: CGFloat,
                              sectionInsetBottom: CGFloat,
                              headerHeight: CGFloat = 0,
                              footerHeight: CGFloat = 0) -> CGFloat {
        
        let remain = itemCount % itemCountInSingleLine
        var lines = itemCount / itemCountInSingleLine
        if remain != 0 {
            lines += 1
        }
        
        let besideHeight = sectionInsetTop + sectionInsetBottom + headerHeight + footerHeight
        if lines == 0 {
            return 0
        }
        
        let h = CGFloat(lines) * itemHeight + (CGFloat(lines) - 1) * itemSpacingVertical + besideHeight
        return ceil(h)// 向上取整(意思就是稍微大一点，防止内容可滑动)
    }
    
    /// 实例方法获取内容的高度
    /// - Parameter itemCountInSingleLine: 单行item的数量
    /// - Returns: 内容高度
    func contentHeight(itemCountInSingleLine: Int, itemHeight: CGFloat? = nil) -> CGFloat {
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout, layout.scrollDirection == .vertical, numberOfSections == 1 else { return 0 }
        
        return UICollectionView.contentHeight(itemCountInSingleLine: itemCountInSingleLine,
                                              itemHeight: itemHeight ?? layout.itemSize.height,
                                              itemCount: numberOfItems(inSection: 0),
                                              itemSpacingVertical: layout.minimumLineSpacing,
                                              sectionInsetTop: layout.sectionInset.top,
                                              sectionInsetBottom: layout.sectionInset.bottom,
                                              headerHeight: layout.headerReferenceSize.height,
                                              footerHeight: layout.footerReferenceSize.height)
    }
}
