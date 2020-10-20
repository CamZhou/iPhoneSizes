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

  private lazy var allDevices = DeviceType.allCases

  // MARK: - Subviews

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()

  // MARK: - View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Select a device"
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    showOnboardingIfNeeded()
  }
}

// MARK: - Private Helpers

extension DeviceSelectionViewController {

  func device(at indexPath: IndexPath) -> DeviceType? {
    guard indexPath.row < allDevices.count else { return nil }
    return allDevices[indexPath.row]
  }

}

// MARK: - Routing

extension DeviceSelectionViewController {

  func showOnboardingIfNeeded() {
    _ = showOnboardingViewControllerIfNeeded
  }

  func showDeviceDetail(with device: DeviceType) {
    let controller = DeviceDetailViewController(currentDevice: CurrentDeviceMock(), targetDevice: DeviceMock())
    navigationController?.pushViewController(controller, animated: true)
  }
}

// MARK: - UITableViewDataSource

extension DeviceSelectionViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    allDevices.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = device(at: indexPath)?.rawValue
    return cell
  }
}

// MARK: - UITableViewDelegate

extension DeviceSelectionViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let device = device(at: indexPath) else { return }
    showDeviceDetail(with: device)
  }
}
