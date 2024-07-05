//
//  FocusCollectionView.swift
//
//
//  Created by yoonjae on 7/5/24.
//

import UIKit

public class FocusCollectionView: UICollectionView {
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Indicates whether shadow effect is enabled for the cells. Default is true.
    public var isShadowEnabled: Bool = true
    
    /// Scale factor for the focused cell. Default is 1.1.
    public var focusScale: CGFloat = 1.1
    
    /// Indicates whether scaling effect is enabled for the cells. Default is true.
    public var isScaleEnabled: Bool = true
        
    /// Keeps track of the current index of the focused cell.
    private var currentIndex: CGFloat = 0
    
    /// Keeps track of the current focused cell.
    private var currentCell: UICollectionViewCell?
    
    /// Initializes the collection view.
    private func initCollectionView() {
        self.delegate = self
        self.decelerationRate = .fast
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FocusCollectionView: UICollectionViewDelegateFlowLayout, CellTransformable {
    
    /// Sets insets for the collection view to center the cells.
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        makeCollectionViewInsets(collectionView)
    }
    
    /// Adjusts the final content offset when the user ends dragging to ensure the nearest cell is centered.
    public func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            guard let collectionView = scrollView as? UICollectionView,
                  let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
                return
            }
            
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            var roundedIndex = round(index)
            
            if scrollView.contentOffset.x > targetContentOffset.pointee.x {
                roundedIndex = floor(index)
            } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
                roundedIndex = ceil(index)
            } else {
                roundedIndex = round(index)
            }
            
            if currentIndex > roundedIndex {
                currentIndex -= 1
                roundedIndex = currentIndex
            } else if currentIndex < roundedIndex {
                currentIndex += 1
                roundedIndex = currentIndex
            }
            
            offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
            targetContentOffset.pointee = offset
        }
    
    /// Adjusts the scale and shadow of the cells as the user scrolls to give focus effect to the center cell.
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
            guard let collectionView = scrollView as? UICollectionView else {
                return
            }
            
            let centerPoint = CGPoint(
                x: collectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                y: collectionView.frame.size.height / 2 + scrollView.contentOffset.y)
            
            if let indexPath = collectionView.indexPathForItem(at: centerPoint),
               let cell = collectionView.cellForItem(at: indexPath) {
                
                if isScaleEnabled { transformToLarge(cell: cell, scale: focusScale)}
                if isShadowEnabled { showShadowForCell(cell: cell) }
                currentCell = cell
            }
            
            if let cell = currentCell {
                let offsetX = centerPoint.x - cell.center.x
                
                if offsetX < -15 || offsetX > 15 {
                    
                    if isScaleEnabled { transformToStandard(cell: cell) }
                    if isShadowEnabled { removeShadowForCell(cell: cell) }
                    currentCell = nil
                }
            }
        }
    
    /// Adjusts the scale and shadow of the cells when the user after scroll
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if currentIndex == 0 && indexPath.item == 0 {
            
                if isScaleEnabled { transformToLarge(cell: cell, scale: focusScale) }
                if isShadowEnabled { showShadowForCell(cell: cell) }
                currentCell = cell
            
        }
    }
}
