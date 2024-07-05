//
//  CellTransformable.swift
//
//
//  Created by yoonjae on 7/5/24.
//

import UIKit

public protocol CellTransformable {
    /// Transforms the given cell to a larger scale.
    func transformToLarge(cell: UICollectionViewCell, scale: CGFloat)
    
    /// Transforms the given cell to its original size.
    func transformToStandard(cell: UICollectionViewCell)
    
    /// Shows shadow for the given cell.
    func showShadowForCell(cell: UICollectionViewCell)
    
    /// Removes shadow from the given cell.
    func removeShadowForCell(cell: UICollectionViewCell)
    
    /// Calculates and returns insets for the collection view to center the cells.
    func makeCollectionViewInsets(_ collectionView: UICollectionView) -> UIEdgeInsets
}

extension CellTransformable {
    
    /// Transforms the given cell to a larger scale with animation and haptic feedback.
    public func transformToLarge(
        cell: UICollectionViewCell,
        scale: CGFloat) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
    
    /// Transforms the given cell to its original size with animation.
    public func transformToStandard(cell: UICollectionViewCell) {
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
    /// Shows shadow for the given cell by adjusting its layer properties.
    public func showShadowForCell(cell: UICollectionViewCell) {
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.layer.shadowRadius = 6
        cell.layer.shadowOpacity = 0.1
    }
    
    /// Removes shadow from the given cell by resetting its layer properties.
    public func removeShadowForCell(cell: UICollectionViewCell) {
        cell.layer.shadowColor = UIColor.clear.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 0
        cell.layer.shadowOpacity = 0
    }
    
    /// Calculates and returns insets for the collection view to center the cells horizontally.
    public func makeCollectionViewInsets(_ collectionView: UICollectionView) -> UIEdgeInsets {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        
        let horizontalInset: CGFloat = (collectionView.frame.width / 2) - (layout.itemSize.width / 2)
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
}


