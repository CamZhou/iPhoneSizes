//
//  DeviceSelectionViewController.swift
//  iPhoneSizes
//
//  Created by Cam Zhou on 10/15/20.
//

import UIKit

final class DeviceSelectionViewController: UIViewController {

  private lazy var showOnboardingViewControllerIfNeeded: Void = {
    if OnboardingViewController.shouldShow {
      present(OnboardingViewController(), animated: true, completion: nil)
    }
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    _ = showOnboardingViewControllerIfNeeded
  }
}
