//
//  ViewController.swift
//  DemoCollectionView
//
//  Created by saffron on 14/03/18.
//  Copyright © 2018 saffron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cellCount:Int = 11
    var numberOfCells:Int = 3
    var numberOfRows:Int = 0
    var rowsCounter = 1
    var cellsInRowCounter = 1
    var remainCell:Int = 0
    var lastCellIndex = 0
    var secondLastCellIndex = 0
    var bannerHeight:CGFloat = 200
    var cellHeight:CGFloat = 100
    
    @IBOutlet weak var collectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfRows = cellCount / numberOfCells
        remainCell = cellCount % numberOfCells
        if remainCell > 1 {
            secondLastCellIndex = cellCount + 1 - remainCell
            lastCellIndex = cellCount + 2 - remainCell
        } else {
            lastCellIndex = cellCount + 1 - remainCell
            
        }
        calculateHeight()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount + 1
    }
    func calculateHeight() {
        bannerHeight = ScreenHeight * 0.4
        let remainHeight = ScreenHeight - bannerHeight
        cellHeight = remainHeight / CGFloat(numberOfRows + 1)
        if bannerHeight < 200 {
            bannerHeight = 200
        }
        if cellHeight < 100 {
            cellHeight = 100
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var screenWidthL:CGFloat = 0
        var screnHeightL:CGFloat = 0
        if indexPath.row == 0 {
            screenWidthL = ScreenWidth
            screnHeightL = bannerHeight
        } else if indexPath.row == lastCellIndex  && lastCellIndex != 0 {
            screenWidthL = ScreenWidth / CGFloat(remainCell)
            screnHeightL = cellHeight
        } else if indexPath.row == secondLastCellIndex  && secondLastCellIndex != 0 {
            screenWidthL = ScreenWidth / CGFloat(remainCell)
            screnHeightL = cellHeight
        } else {
            if rowsCounter % 2 == 0 {
                if cellsInRowCounter == numberOfCells {
                    screenWidthL = (ScreenWidth) / 2
                    screnHeightL = cellHeight
                } else {
                    let width  = (ScreenWidth) / 2
                    screenWidthL = width / 2
                    screnHeightL = cellHeight
                }
                cellsInRowCounter = cellsInRowCounter + 1
            } else {
                if cellsInRowCounter == 1 {
                    screenWidthL = (ScreenWidth ) / 2
                    screnHeightL = cellHeight
                } else {
                    let width  = (ScreenWidth) / 2
                    screenWidthL = width / 2
                    screnHeightL = cellHeight
                }
                cellsInRowCounter = cellsInRowCounter + 1
            }
            if indexPath.row % numberOfCells == 0 {
                cellsInRowCounter = 1
                rowsCounter = rowsCounter + 1
            }
        }
        
           return CGSize(width: screenWidthL, height: screnHeightL)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! CellCVC
        cell.mainView.backgroundColor = UIColor.random()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}

