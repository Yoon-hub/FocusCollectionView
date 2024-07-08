//
//  FocusCollectionViewDelegate.swift
//
//
//  Created by 윤제 on 7/8/24.
//

import UIKit

/// A delegate protocol for the `FocusCollectionView` class.
@objc public protocol FocusCollectionViewDelegate {
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath)
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath)
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool
    
    @objc optional
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)
}

/// A collection view that supports focus-based selection.
extension FocusCollectionView: UICollectionViewDelegate {
    
    public func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        focusDelegate?.collectionView?(
            collectionView,
            didSelectItemAt: indexPath
        )
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        didDeselectItemAt indexPath: IndexPath
    ) {
        focusDelegate?.collectionView?(
            collectionView,
            didDeselectItemAt: indexPath
        )
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        focusDelegate?.collectionView?(
            collectionView,
            shouldSelectItemAt: indexPath
        ) ?? true
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        shouldDeselectItemAt indexPath: IndexPath
    ) -> Bool {
        focusDelegate?.collectionView?(
            collectionView,
            shouldDeselectItemAt: indexPath
        ) ?? true
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        willDisplaySupplementaryView view: UICollectionReusableView,
        forElementKind elementKind: String, at indexPath: IndexPath
    ) {
        focusDelegate?.collectionView?(
            collectionView,
            willDisplaySupplementaryView: view,
            forElementKind: elementKind,
            at: indexPath)
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplaying cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        focusDelegate?.collectionView?(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplayingSupplementaryView view: UICollectionReusableView,
        forElementOfKind elementKind: String,
        at indexPath: IndexPath
    ) {
        focusDelegate?.collectionView?(
            collectionView,
            didEndDisplayingSupplementaryView: view,
            forElementOfKind: elementKind,
            at: indexPath)
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        shouldShowMenuForItemAt indexPath: IndexPath
    ) -> Bool {
        focusDelegate?.collectionView?(
            collectionView,
            shouldShowMenuForItemAt: indexPath
        ) ?? false
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        canPerformAction action: Selector,
        forItemAt indexPath: IndexPath,
        withSender sender: Any?
    ) -> Bool {
        focusDelegate?.collectionView?(
            collectionView,
            canPerformAction: action,
            forItemAt: indexPath,
            withSender: sender
        ) ?? false
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        performAction action: Selector,
        forItemAt indexPath: IndexPath,
        withSender sender: Any?
    ) {
        focusDelegate?.collectionView?(
            collectionView,
            performAction: action,
            forItemAt: indexPath,
            withSender: sender
        )
    }
}
