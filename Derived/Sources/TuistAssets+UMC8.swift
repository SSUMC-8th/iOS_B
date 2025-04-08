// swiftlint:disable:this file_name
// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum UMC8Asset: Sendable {
  public enum Assets {
  public static let accentColor = UMC8Colors(name: "AccentColor")
    public static let cSicon1 = UMC8Images(name: "CSicon1")
    public static let cSicon2 = UMC8Images(name: "CSicon2")
    public static let cSicon3 = UMC8Images(name: "CSicon3")
    public static let cSicon4 = UMC8Images(name: "CSicon4")
    public static let cSicon5 = UMC8Images(name: "CSicon5")
    public static let christmasAdvertisement = UMC8Images(name: "Christmas_Advertisement")
    public static let payicon1 = UMC8Images(name: "Payicon1")
    public static let payicon2 = UMC8Images(name: "Payicon2")
    public static let payicon3 = UMC8Images(name: "Payicon3")
    public static let payicon4 = UMC8Images(name: "Payicon4")
    public static let starbuckslogo = UMC8Images(name: "Starbuckslogo")
    public static let appleloginbutton = UMC8Images(name: "appleloginbutton")
    public static let icon02 = UMC8Images(name: "icon02")
    public static let icon02selected = UMC8Images(name: "icon02selected")
    public static let icon1 = UMC8Images(name: "icon1")
    public static let icon1selected = UMC8Images(name: "icon1selected")
    public static let icon3 = UMC8Images(name: "icon3")
    public static let icon3selected = UMC8Images(name: "icon3selected")
    public static let icon4 = UMC8Images(name: "icon4")
    public static let icon4selected = UMC8Images(name: "icon4selected")
    public static let icon5 = UMC8Images(name: "icon5")
    public static let icon5selected = UMC8Images(name: "icon5selected")
    public static let kakaoLogo = UMC8Images(name: "kakao_Logo")
    public static let kakaologinbutton = UMC8Images(name: "kakaologinbutton")
    public static let logout = UMC8Images(name: "logout")
    public static let myReceipt = UMC8Images(name: "myReceipt")
    public static let myStar = UMC8Images(name: "myStar")
    public static let mymenu = UMC8Images(name: "mymenu")
    public static let welcomehandicon = UMC8Images(name: "welcomehandicon")
  }
  public enum Color2 {
  public static let starColor = UMC8Colors(name: "starColor")
    public static let textColor = UMC8Colors(name: "textColor")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class UMC8Colors: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public var color: Color {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIColor: SwiftUI.Color {
      return SwiftUI.Color(asset: self)
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension UMC8Colors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: UMC8Colors) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: UMC8Colors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct UMC8Images: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Image {
  init(asset: UMC8Images) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }

  init(asset: UMC8Images, label: Text) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: UMC8Images) {
    let bundle = Bundle.module
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
