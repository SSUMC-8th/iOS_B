//
//  OrderMenuView.swift
//  Starbucks
//
//  Created by 바견규 on 4/2/25.
//

    import SwiftUI

    struct TemperatureToggleView: View {
        @Binding var selected: CoffeeTemperature
        let option: CoffeeTemperatureOption

        var body: some View {
            HStack(spacing: 0) {
                switch option {
                case .both:
                    ForEach(CoffeeTemperature.allCases, id: \.self) { temp in
                        Button(action: {
                            withAnimation {
                                selected = temp
                            }
                        }) {
                            Text(temp.rawValue)
                                .font(Font.Pretend.pretendardSemiBold(size: 18))
                                .foregroundColor(selected == temp ? (temp == .hot ? .red : .blue) : .gray)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(selected == temp ? .white : .clear)
                                .clipShape(Capsule())
                        }
                    }

                case .hotOnly:
                    Text("HOT ONLY")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .onAppear {
                            selected = .hot
                        }

                case .icedOnly:
                    Text("ICED ONLY")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .onAppear {
                            selected = .iced
                        }
                }
            }
            .padding(4)
            .background(Color(UIColor.systemGray5))
            .clipShape(Capsule())
        }
    }


    struct OrderMenuView: View {
        init(coffee: OrderMenuModel, selectedTemp: CoffeeTemperature) {
            self.coffee = coffee
            self.selectedTemp = selectedTemp
        }
        
        let coffee: OrderMenuModel
        @State private var selectedTemp: CoffeeTemperature
        
        var currentVariant: CoffeeVariant? {
            switch selectedTemp {
            case .hot:
                return coffee.hot
            case .iced:
                return coffee.iced
            }
        }

        var body: some View {
            VStack(alignment: .leading) {
                if let variant = currentVariant {
                    Image(variant.imageName)
                        .resizable()
                        .scaledToFit()

                    HStack {
                        Text(variant.menuName)
                            .font(Font.Pretend.pretendardSemiBold(size: 24))
                            .foregroundStyle(Color("black03"))
                            .padding(.vertical)
                            .padding(.leading)

                        Image("new")
                    }

                    Text(variant.enMenuName)
                        .font(Font.Pretend.pretendardSemiBold(size: 14))
                        .foregroundStyle(Color("gray01"))
                        .padding(.horizontal)

                    Text(variant.description)
                        .font(Font.Pretend.pretendardMedium(size: 14))
                        .foregroundStyle(Color("gray06"))
                        .padding()

                    Text(variant.price)
                        .font(Font.Pretend.pretendardLight(size: 24))
                        .padding(.horizontal)
                }

                TemperatureToggleView(selected: $selectedTemp, option: coffee.tempOption)
                    .padding(.horizontal)

                Spacer()

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {
                print("주문하기: \(selectedTemp.rawValue)")
            }) {
                Text("주문하기")
                    .foregroundStyle(Color.white)
                    .font(Font.Pretend.pretendardMedium(size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 43)
            }
            .frame(width: 402, height: 43)
            .buttonStyle(.borderedProminent)
            .tint(Color("green00"))
            .cornerRadius(20)
        }
    }

    #Preview {
    }
