//
//  DeviceDetailInput.swift
//  iPhoneSizes
//
//  Created by Yibin Yan on 10/16/20.
//
import UIKit

protocol DeviceDetailInput {
  var image: UIImage? { get }
  var width: Double { get } // In Inch
  var height: Double { get } // In Inch
  var weight: Double { get } // In ounce
  var ppi: Int { get }
}

struct DeviceMock : DeviceDetailInput {
  var image = UIImage(named: "iphone11")
  var width = Double(3)
  var height = Double(6)
  var weight = Double(5)
  var ppi = 400
}

struct CurrentDeviceMock : DeviceDetailInput {
  var image: UIImage?
  var width = Double(UIScreen.main.bounds.width)
  var height = Double(UIScreen.main.bounds.height)
  var weight = Double(6)
  var ppi = 400
}
