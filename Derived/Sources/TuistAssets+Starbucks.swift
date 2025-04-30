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
public enum StarbucksAsset: Sendable {
  public enum Assets {
  public static let accentColor = StarbucksColors(name: "AccentColor")
    public static let black01 = StarbucksColors(name: "black01")
    public static let black02 = StarbucksColors(name: "black02")
    public static let black03 = StarbucksColors(name: "black03")
    public static let brown02 = StarbucksColors(name: "brown02")
    public static let gray01 = StarbucksColors(name: "gray01")
    public static let gray03 = StarbucksColors(name: "gray03")
    public static let gray04 = StarbucksColors(name: "gray04")
    public static let gray06 = StarbucksColors(name: "gray06")
    public static let green00 = StarbucksColors(name: "green00")
    public static let starbucksPin = StarbucksImages(name: "StarbucksPin")
    public static let dtBadge = StarbucksImages(name: "DTBadge")
    public static let reserveBadge = StarbucksImages(name: "ReserveBadge")
    public static let orderDrink라벤터카페브레베 = StarbucksImages(name: "OrderDrink라벤터카페브레베")
    public static let orderDrink럼샷코르타도 = StarbucksImages(name: "OrderDrink럼샷코르타도")
    public static let orderDrink병음료 = StarbucksImages(name: "OrderDrink병음료")
    public static let orderDrink아이스카라멜마끼아또 = StarbucksImages(name: "OrderDrink아이스카라멜마끼아또")
    public static let orderDrink아이스카페아메리카노 = StarbucksImages(name: "OrderDrink아이스카페아메리카노")
    public static let orderDrink아이스카푸치노 = StarbucksImages(name: "OrderDrink아이스카푸치노")
    public static let orderDrink아포가토 = StarbucksImages(name: "OrderDrink아포가토")
    public static let orderDrink추천 = StarbucksImages(name: "OrderDrink추천")
    public static let orderDrink카라멜마끼아또 = StarbucksImages(name: "OrderDrink카라멜마끼아또")
    public static let orderDrink카페아메리카노 = StarbucksImages(name: "OrderDrink카페아메리카노")
    public static let orderDrink카푸치노 = StarbucksImages(name: "OrderDrink카푸치노")
    public static let receiptIcon = StarbucksImages(name: "receiptIcon")
    public static let shopAllProduct1 = StarbucksImages(name: "ShopAllProduct1")
    public static let shopAllProduct2 = StarbucksImages(name: "ShopAllProduct2")
    public static let shopAllProduct3 = StarbucksImages(name: "ShopAllProduct3")
    public static let shopAllProduct4 = StarbucksImages(name: "ShopAllProduct4")
    public static let shopAllProduct5 = StarbucksImages(name: "ShopAllProduct5")
    public static let shopAllProduct6 = StarbucksImages(name: "ShopAllProduct6")
    public static let shopBestItems1 = StarbucksImages(name: "ShopBestItems1")
    public static let shopBestItems2 = StarbucksImages(name: "ShopBestItems2")
    public static let shopBestItems3 = StarbucksImages(name: "ShopBestItems3")
    public static let shopBestItems4 = StarbucksImages(name: "ShopBestItems4")
    public static let shopBestItems5 = StarbucksImages(name: "ShopBestItems5")
    public static let shopBestItems6 = StarbucksImages(name: "ShopBestItems6")
    public static let shopBestItems7 = StarbucksImages(name: "ShopBestItems7")
    public static let shopBestItems8 = StarbucksImages(name: "ShopBestItems8")
    public static let shopNewProduct1 = StarbucksImages(name: "ShopNewProduct1")
    public static let shopNewProduct2 = StarbucksImages(name: "ShopNewProduct2")
    public static let shopNewProduct3 = StarbucksImages(name: "ShopNewProduct3")
    public static let shopNewProduct4 = StarbucksImages(name: "ShopNewProduct4")
    public static let shopWhatsNew1 = StarbucksImages(name: "ShopWhatsNew1")
    public static let shopWhatsNew2 = StarbucksImages(name: "ShopWhatsNew2")
    public static let shopWhatsNew3 = StarbucksImages(name: "ShopWhatsNew3")
    public static let americano = StarbucksImages(name: "Americano")
    public static let bloomingChouxPring = StarbucksImages(name: "BloomingChouxPring")
    public static let buddyPass = StarbucksImages(name: "BuddyPass")
    public static let cSicon1 = StarbucksImages(name: "CSicon1")
    public static let cSicon2 = StarbucksImages(name: "CSicon2")
    public static let cSicon3 = StarbucksImages(name: "CSicon3")
    public static let cSicon4 = StarbucksImages(name: "CSicon4")
    public static let cSicon5 = StarbucksImages(name: "CSicon5")
    public static let caramelMakiatto = StarbucksImages(name: "CaramelMakiatto")
    public static let christmasAdvertisement = StarbucksImages(name: "Christmas_Advertisement")
    public static let deliveryBanner = StarbucksImages(name: "DeliveryBanner")
    public static let homeBearBanner = StarbucksImages(name: "HomeBearBanner")
    public static let newOranizationRecruit = StarbucksImages(name: "NewOranizationRecruit")
    public static let newReserveCoffe = StarbucksImages(name: "NewReserveCoffe")
    public static let noDisposableCupDay = StarbucksImages(name: "NoDisposableCupDay")
    public static let onlineStoreStarbanner = StarbucksImages(name: "OnlineStoreStarbanner")
    public static let payicon1 = StarbucksImages(name: "Payicon1")
    public static let payicon2 = StarbucksImages(name: "Payicon2")
    public static let payicon3 = StarbucksImages(name: "Payicon3")
    public static let payicon4 = StarbucksImages(name: "Payicon4")
    public static let appleLogo = StarbucksImages(name: "apple_Logo")
    public static let chevronLeft = StarbucksImages(name: "chevron-left")
    public static let espressoConpana = StarbucksImages(name: "espressoConpana")
    public static let espressoMakiatto = StarbucksImages(name: "espressoMakiatto")
    public static let homeNavRight = StarbucksImages(name: "homeNavRight")
    public static let homeTopImg = StarbucksImages(name: "homeTopImg")
    public static let iceAmericano = StarbucksImages(name: "iceAmericano")
    public static let iceCaramelMakiatto = StarbucksImages(name: "iceCaramelMakiatto")
    public static let icon02 = StarbucksImages(name: "icon02")
    public static let icon02selected = StarbucksImages(name: "icon02selected")
    public static let icon1 = StarbucksImages(name: "icon1")
    public static let icon1selected = StarbucksImages(name: "icon1selected")
    public static let icon3 = StarbucksImages(name: "icon3")
    public static let icon3selected = StarbucksImages(name: "icon3selected")
    public static let icon4 = StarbucksImages(name: "icon4")
    public static let icon4selected = StarbucksImages(name: "icon4selected")
    public static let icon5 = StarbucksImages(name: "icon5")
    public static let icon5selected = StarbucksImages(name: "icon5selected")
    public static let kakaoLogo = StarbucksImages(name: "kakao_Logo")
    public static let logout = StarbucksImages(name: "logout")
    public static let mugcupBanner = StarbucksImages(name: "mugcupBanner")
    public static let myReceipt = StarbucksImages(name: "myReceipt")
    public static let myStar = StarbucksImages(name: "myStar")
    public static let mymenu = StarbucksImages(name: "mymenu")
    public static let new = StarbucksImages(name: "new")
    public static let starbucksLogo = StarbucksImages(name: "starbucks_Logo")
    public static let welcomehandicon = StarbucksImages(name: "welcomehandicon")
    public static let coldBrewBanner = StarbucksImages(name: "ColdBrewBanner")
    public static let starbucksCreateBanner = StarbucksImages(name: "StarbucksCreateBanner")
    public static let juiceBanner = StarbucksImages(name: "juiceBanner")
    public static let caramelHot = StarbucksImages(name: "CaramelHot")
    public static let americanoHot = StarbucksImages(name: "americanoHot")
    public static let americanpCold = StarbucksImages(name: "americanpCold")
    public static let caramerlCold = StarbucksImages(name: "caramerlCold")
    public static let confana = StarbucksImages(name: "confana")
    public static let back = StarbucksImages(name: "back")
    public static let share = StarbucksImages(name: "share")
    public static let macchiato = StarbucksImages(name: "macchiato")
    public static let nirtyCrr = StarbucksImages(name: "NirtyCrr")
    public static let bangOshocola = StarbucksImages(name: "bangOshocola")
    public static let minileafpie = StarbucksImages(name: "minileafpie")
    public static let sausageOlivePie = StarbucksImages(name: "sausageOlivePie")
    public static let sausagebulgogi = StarbucksImages(name: "sausagebulgogi")
    public static let 하기싫어 = StarbucksImages(name: "하기싫어")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class StarbucksColors: Sendable {
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

public extension StarbucksColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: StarbucksColors) {
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
  init(asset: StarbucksColors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct StarbucksImages: Sendable {
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
  init(asset: StarbucksImages) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }

  init(asset: StarbucksImages, label: Text) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: StarbucksImages) {
    let bundle = Bundle.module
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
