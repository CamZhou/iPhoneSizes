//
//  OnboardingViewController.swift
//  iPhoneSizes
//
//  Created by Cam Zhou on 10/15/20.
//

import UIKit
import paper_onboarding

final class OnboardingViewController: UIViewController {

  private enum Constants {
    static let seeOnboardingCount = "see_onboarding_count"
    static let maxOnboardingTime = 5 // TBD
  }

  static var shouldShow: Bool {
    UserDefaults.standard.integer(forKey: Constants.seeOnboardingCount) < Constants.maxOnboardingTime
  }

  init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .fullScreen
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let onboarding = PaperOnboarding()
    onboarding.dataSource = self
    onboarding.delegate = self
    onboarding.tintColor = .white
    onboarding.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(onboarding)
    onboarding.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    onboarding.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    onboarding.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    onboarding.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    let seeOnboardingCount = UserDefaults.standard.integer(forKey: Constants.seeOnboardingCount)
    UserDefaults.standard.setValue(seeOnboardingCount + 1, forKey: Constants.seeOnboardingCount)
  }
}

private extension OnboardingViewController {
  enum Page: Int, CaseIterable {
    case lookingToBuy = 0
    case findDevice
    case compare
  }

  var pageIcon: UIImage {
    if #available(iOS 13.0, *),
       let image = UIImage(systemName: "checkmark.circle.fill",
                           withConfiguration: UIImage.SymbolConfiguration(scale: .small)) {
      return image
    } else {
      return UIImage()
    }
  }
}

extension OnboardingViewController.Page {
  var title: String {
    switch self {
    case .lookingToBuy: return "Looking to buy a new phone but not sure about which size fits you the best?"
    case .findDevice: return "Find a device that you are thinking about getting in our device list"
    case .compare: return "Look and feel the new device before you make an order"
    }
  }

  var description: String {
    switch self {
    case .lookingToBuy: return "We are here to help."
    case .findDevice: return "We've got all the new device info."
    case .compare: return "You can observe the actual size of the device."
    }
  }

  var color: UIColor {
    switch self {
    case .lookingToBuy: return UIColor(red: 108 / 255, green: 70 / 255, blue: 79 / 255, alpha: 1)
    case .findDevice: return UIColor(red: 158 / 255, green: 118 / 255, blue: 143 / 255, alpha: 1)
    case .compare: return UIColor(red: 159 / 255, green: 164 / 255, blue: 196 / 255, alpha: 1)
    }
  }

  var icon: UIImage {
    guard #available(iOS 13.0, *) else { return UIImage() }
    let config = UIImage.SymbolConfiguration(scale: .large)
    switch self {
    case .lookingToBuy: return UIImage(systemName: "cart", withConfiguration: config)!
    case .findDevice: return UIImage(systemName: "magnifyingglass", withConfiguration: config)!
    case .compare: return UIImage(systemName: "hand.thumbsup", withConfiguration: config)!
    }
  }
}

extension OnboardingViewController: PaperOnboardingDataSource {
  func onboardingItemsCount() -> Int {
    Page.allCases.count
  }

  func onboardingItem(at index: Int) -> OnboardingItemInfo {
    let page = Page(rawValue: index) ?? .lookingToBuy
    return OnboardingItemInfo(informationImage: page.icon,
                              title: page.title,
                              description: page.description,
                              pageIcon: pageIcon,
                              color: page.color,
                              titleColor: .white,
                              descriptionColor: .white,
                              titleFont: UIFont.boldSystemFont(ofSize: 20),
                              descriptionFont: UIFont.systemFont(ofSize: 16))
  }
}

extension OnboardingViewController: PaperOnboardingDelegate {
  func onboardingWillTransitonToLeaving() {
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = .reveal
    transition.subtype = .fromRight
    self.view.window!.layer.add(transition, forKey: nil)
    dismiss(animated: false, completion: nil)
  }
}
