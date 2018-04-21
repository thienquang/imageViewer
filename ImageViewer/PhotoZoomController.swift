//
//  PhotoZoomController.swift
//  ImageViewer
//
//  Created by Thien Le quang on 4/21/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class PhotoZoomController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var photoImageView: UIImageView!
  
  @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
  
  var photo: Photo!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    photoImageView.image = photo.image
    photoImageView.sizeToFit()
    scrollView.contentSize = photoImageView.bounds.size
    updateZoomScale()
    updateConstrainsForSize(view.bounds.size)
    view.backgroundColor = .black
  }
  
  var minZoomScale: CGFloat {
    let viewSize = view.bounds.size
    let widthScale = viewSize.width/photoImageView.bounds.width
    let heightScale = viewSize.height / photoImageView.bounds.height
    
    return  min(widthScale, heightScale)
  }
  
  func updateZoomScale() {
    
    scrollView.minimumZoomScale = minZoomScale
    scrollView.zoomScale = minZoomScale
    
  }
  
  
  func updateConstrainsForSize(_ size: CGSize) {
    let verticalSpace = size.height - photoImageView.frame.height
    let yOffset = max(0, verticalSpace/2)
    imageTopConstraint.constant = yOffset
    imageViewBottomConstraint.constant = yOffset
    
    let xOffset = max(0, (size.width - photoImageView.frame.width)/2)
    imageViewLeadingConstraint.constant = xOffset
    imageViewTrailingConstraint.constant = xOffset
    
  }
}

extension PhotoZoomController: UIScrollViewDelegate {
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return photoImageView
  }
  
  func scrollViewDidZoom(_ scrollView: UIScrollView) {
    updateConstrainsForSize(view.bounds.size)
    if scrollView.zoomScale < minZoomScale {
      dismiss(animated: true, completion: nil)
    }
  }
  
}
