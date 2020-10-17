//
//  DeviceType.swift
//  iPhoneSizes
//
//  Created by Peiquan Lin on 10/16/20.
//

import UIKit

enum DeviceType: String, CaseIterable {
  case iPhone12ProMax = ""
  case iPhone12Pro
  case iPhone12
  case iPhone12Mini
  case iPhoneSe2020
  case iPhone11ProMax
  case iPhone11Pro
  case iPhone11
  case iPhoneXR
  case iPhoneXS
  case iPhoneXSMax
  case iPhoneX
  case iPhone8Plus
  case iPhone8 = "iPhone10,1"
  case iPhone7Plus = "iPhone9,2"
  case iPhone7 = "iPhone9,1"
  case iPhoneSE = "iPhone12,8"
  case iPhone6sPlus = "iPhone8,2"
  case iPhone6s = "iPhone8,1"
}

extension DeviceType {
  var width: Double {
    switch self {
    case .iPhone11: return 2.98
    case .iPhone11Pro: return 2.81
    case .iPhone11ProMax: return 3.06
    case .iPhoneSe2020: return 2.64
    case .iPhone12: return 2.81
    case .iPhone12Mini: return 2.52
    case .iPhone12Pro: return 2.81
    case .iPhone12ProMax: return 3.07
    case .iPhoneXR: return 2.98
    case .iPhoneXS: return 2.79
    case .iPhoneXSMax: return 3.04
    case .iPhoneX: return 2.79
    case .iPhone8Plus: return 3.07
    case .iPhone8: return 2.64
    case .iPhone7Plus: return 3.06
    case .iPhone7: return 2.64
    case .iPhoneSE: return 2.3
    case .iPhone6sPlus: return 3.06
    case .iPhone6s: return 2.643
    }
  }

  var height: Double {
    switch self {
    case .iPhone11: return 5.94
    case .iPhone11Pro: return 5.66
    case .iPhone11ProMax: return 6.22
    case .iPhoneSe2020: return 5.44
    case .iPhone12: return 5.77
    case .iPhone12Mini: return 5.17
    case .iPhone12Pro: return 5.77
    case .iPhone12ProMax: return 6.33
    case .iPhoneXR: return 5.94
    case .iPhoneXS: return 5.65
    case .iPhoneXSMax: return 6.20
    case .iPhoneX: return 5.65
    case .iPhone8Plus: return 6.23
    case .iPhone8: return 5.44
    case .iPhone7Plus: return 6.22
    case .iPhone7: return 5.44
    case .iPhoneSE: return 4.87
    case .iPhone6sPlus: return 6.22
    case .iPhone6s: return 5.44
    }
  }

  var weight: Double {
    switch self {
    case .iPhone11: return 6.84
    case .iPhone11Pro: return 6.63
    case .iPhone11ProMax: return 7.97
    case .iPhoneSe2020: return 5.22
    case .iPhone12: return 5.78
    case .iPhone12Mini: return 4.76
    case .iPhone12Pro: return 6.66
    case .iPhone12ProMax: return 8.04
    case .iPhoneXR: return 6.84
    case .iPhoneXS: return 6.24
    case .iPhoneXSMax: return 7.33
    case .iPhoneX: return 6.13
    case .iPhone8Plus: return 7.12
    case .iPhone8: return 5.22
    case .iPhone7Plus: return 6.63
    case .iPhone7: return 4.86
    case .iPhoneSE: return 3.98
    case .iPhone6sPlus: return 6.77
    case .iPhone6s: return 5.04
    }
  }

  var ppi: Int {
    switch self {
    case .iPhone11: return 326
    case .iPhone11Pro: return 458
    case .iPhone11ProMax: return 458
    case .iPhoneSe2020: return 326
    case .iPhone12: return 460
    case .iPhone12Mini: return 476
    case .iPhone12Pro: return 458
    case .iPhone12ProMax: return 458
    case .iPhoneXR: return 326
    case .iPhoneXS: return 458
    case .iPhoneXSMax: return 458
    case .iPhoneX: return 458
    case .iPhone8Plus: return 401
    case .iPhone8: return 326
    case .iPhone7Plus: return 401
    case .iPhone7: return 326
    case .iPhoneSE: return 326
    case .iPhone6sPlus: return 401
    case .iPhone6s: return 326
    }
  }

  var image: UIImage? {
    switch self {
    case .iPhone11: return UIImage(named: "iPhone11")
    case .iPhone11Pro: return UIImage(named: "iPhone11Pro")
    case .iPhone11ProMax: return UIImage(named: "iPhone11ProMax")
    case .iPhoneSe2020: return UIImage(named: "iPhoneSe2020")
    case .iPhone12: return UIImage(named: "iPhone12")
    case .iPhone12Mini: return UIImage(named: "iPhone12Mini")
    case .iPhone12Pro: return UIImage(named: "iphone11")
    case .iPhone12ProMax: return UIImage(named: "iPhone12ProMax")
    case .iPhoneXR: return nil
    case .iPhoneXS: return nil
    case .iPhoneXSMax: return nil
    case .iPhoneX: return nil
    case .iPhone8Plus: return nil
    case .iPhone8: return nil
    case .iPhone7Plus: return nil
    case .iPhone7: return nil
    case .iPhoneSE: return nil
    case .iPhone6sPlus: return nil
    case .iPhone6s: return nil
    }
  }

  var currentType: DeviceType? {
    DeviceType(rawValue: UIDevice.current.model)
  }
}

