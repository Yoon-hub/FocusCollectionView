//
//  ViewController.swift
//  focusSample
//
//  Created by yoonjae on 6/29/24.
//

import UIKit

import FocusCollectionView

class ViewController: UIViewController {
    
    let colors = ["#FA4F79", "#FC676B", "#FF6844", "#FA975C", "#FDA84B", "#FDA84B", "#EDC32B", "#EDD70E", "#C3CB16", "#A2C41F", "#8BCD1F", "#8BCD1F", "#25C43F", "#30CF7A", "#4AE6AC", "#3BEABC", "#25DCBC", "#25CDBE", "#4AE2DF", "#30D2DC", "#02A7BE", "#30B4D4", "#2DBAEE", "#54B4FE", "#97BEFF", "#90A2FE", "#C3BCFC", "#DBC5FE", "#CD82FA", "#E885F9", "#FF42F8", "#FA5ADA", "#FF97DA", "#FB89C1", "#FBA5C3"]
    
    let focusCollectionView: FocusCollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionViewHorizontalSize = UIScreen.main.bounds.width / 2.4
        flowLayout.itemSize = CGSize(width: collectionViewHorizontalSize, height: collectionViewHorizontalSize)
        flowLayout.minimumLineSpacing = 60
        
        flowLayout.scrollDirection = .horizontal
        let focusCollectionView = FocusCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        focusCollectionView.isShadowEnabled = true
        focusCollectionView.focusScale = 1.1
        
        focusCollectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        return focusCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        focusCollectionView.dataSource = self
        
        self.view.addSubview(focusCollectionView)
        focusCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            focusCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            focusCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            focusCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            focusCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor(colors[indexPath.row])
        return cell
        
    }
}


class Cell: UICollectionViewCell {}
