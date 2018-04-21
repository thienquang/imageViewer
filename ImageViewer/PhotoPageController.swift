//
//  PhotoPageController.swift
//  ImageViewer
//
//  Created by Thien Le quang on 4/21/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class PhotoPageController: UIPageViewController {
  
  var photos: [Photo] = []
  var indexOfCurrentPhoto: Int!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.dataSource = self
    if let photoViewerController = photoViewerController(with: photos[indexOfCurrentPhoto]) {
      setViewControllers([photoViewerController], direction: .forward, animated: false, completion: nil)
    }
    
  }
  
  func photoViewerController(with photo: Photo) -> PhotoViewerController? {
    guard let storyboard = storyboard, let photoViewerController =  storyboard.instantiateViewController(withIdentifier: "PhotoViewerController") as? PhotoViewerController else {
      return nil
    }
    
    photoViewerController.photo = photo
    return photoViewerController
  }
}

extension PhotoPageController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return nil
  }
}
