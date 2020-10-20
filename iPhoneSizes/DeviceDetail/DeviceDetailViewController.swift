//
//  DeviceDetailViewController.swift
//  iPhoneSizes
//
//  Created by Cam Zhou on 10/15/20.
//

import UIKit


final class DeviceDetailViewController: UIViewController {
  
  // MARK: - Views
  
  private lazy var scrollView = UIScrollView()
  
  private lazy var deviceView = UIImageView(image: UIImage(named: "iphone"))
  
  private var currentDevice: DeviceDetailInput
  
  private var targetDevice: DeviceDetailInput
  
  init(currentDevice: DeviceDetailInput, targetDevice: DeviceDetailInput) {
    self.currentDevice = currentDevice
    self.targetDevice = targetDevice
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .fullScreen
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavigationBar()
  }
  
  private func setupLayout() {
    view.addSubview(scrollView)
    
    let targetDeviceCGFloatWidth = targetDevice.width*Double(currentDevice.ppi)/Double(UIScreen.main.scale)
    let targetDeviceCGFloatHeight =
        targetDevice.height*Double(currentDevice.ppi)/Double(UIScreen.main.scale)
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    scrollView.addSubview(deviceView)
    scrollView.backgroundColor = UIColor.blue
    
    deviceView.image = targetDevice.image
    deviceView.frame = CGRect(x: 0, y: 0, width: targetDeviceCGFloatWidth, height: targetDeviceCGFloatHeight)
    deviceView.contentMode = .scaleAspectFit
    scrollView.contentSize = CGSize(
      width: max(Double(UIScreen.main.bounds.width), targetDeviceCGFloatWidth),
      height: max(Double(UIScreen.main.bounds.width),targetDeviceCGFloatHeight))
  }
  
  private func setupNavigationBar() {
    let button = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showInfo))
    navigationItem.rightBarButtonItem = button
  }

  @objc private func showInfo() {
    let message: String
    
    if currentDevice.weight > targetDevice.weight {
      let percentLighter = Int((currentDevice.weight - targetDevice.weight) / currentDevice.weight * 100)
      message = "Target device is \(percentLighter)% lighter than your current device"
    } else if currentDevice.weight < targetDevice.weight {
      let percentHeavier = Int((targetDevice.weight - currentDevice.weight) / currentDevice.weight * 100)
      message = "Target device is \(percentHeavier)% heavier than your current device"
    } else {
      message = String(format: "Target device is the same weight as your current device. (%.02f ounces)", targetDevice.weight)
    }
    
    let controller = UIAlertController(title: "Device Info",
                                       message: message,
                                       preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
    present(controller, animated: true, completion: nil)
  }
}
