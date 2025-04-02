import SwiftUI
import Observation

enum CoffeeTemperature: String, CaseIterable, Identifiable {
    case hot = "HOT"
    case iced = "ICED"
    case hotOnly = "HOT ONLY"
    case icedOnly = "ICED ONLY"

    var id: String { self.rawValue }
}

struct CoffeeModel: Identifiable {
    let id = UUID()
    let imageHot: String
    let imageIced: String
    let nameKor: String
    let nameEng: String
    let description: String
    let price: String
    let temperatureOptions: [CoffeeTemperature]
}

let sampleCoffees: [CoffeeModel] = [
    CoffeeModel(
        imageHot: "Coffee_2", imageIced: "Coffee_1",
        nameKor: "아이스 카라멜 마키아또",
        nameEng: "Iced Caramel Macchiato",
        description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료  ",
        price: "6,100원",
        temperatureOptions: [.hot, .iced]
    ),
    CoffeeModel(
        imageHot: "Coffee_2", imageIced: "Coffee_1",
        nameKor: "카라멜 마키아또",
        nameEng: "Caramel Macchiato",
        description: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
        price: "6,100원",
        temperatureOptions: [.hot, .iced]
    ),
    CoffeeModel(
        imageHot: "Coffee_4", imageIced: "Coffee_3",
        nameKor: "아이스 카페 아메리카노",
        nameEng: "Iced Caffe Americano",
        description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
        price: "4,700원",
        temperatureOptions: [.hot, .iced]
    ),
    CoffeeModel(
        imageHot: "Coffee_4", imageIced: "Coffee_3",
        nameKor: "카페 아메리카노",
        nameEng: "Caffe Americano",
        description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피",
        price: "4,700원",
        temperatureOptions: [.hot, .iced]
    ),
    CoffeeModel(
        imageHot: "Coffee_5", imageIced: "Coffee_5",
        nameKor: "에스프레소 콘 파나",
        nameEng: "Espresso Con Panna",
        description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
        price: "4,100원",
        temperatureOptions: [.hot]
    ),
    CoffeeModel(
        imageHot: "Coffee_6", imageIced: "Coffee_6",
        nameKor: "에스프레소 마키아또",
        nameEng: "Espresso Macchiato",
        description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
        price: "3,900원",
        temperatureOptions: [.hot]
    )
]

struct OrderButton: View {
    var body: some View {
        Button(action: {
            print("주문하기")
        }) {
            Text("주문하기")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}


struct CoffeeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let coffee: CoffeeModel
    @State private var selectedTemp: CoffeeTemperature?

    var displayedImage: String {
        switch selectedTemp {
        case .iced, .icedOnly:
            return coffee.imageIced
        default:
            return coffee.imageHot
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            Image(displayedImage)
                .resizable()
                .scaledToFit()
                .frame(height: 300)

            VStack(spacing: 4) {
                Text(coffee.nameKor).font(.title3.bold())
                Text(coffee.nameEng).font(.caption).foregroundColor(.gray)
                Text("new").font(.caption).foregroundColor(.green)
            }

            Text(coffee.description)
                .font(.caption)
                .padding(.horizontal)

            Text(coffee.price)
                .font(.headline)

            if !coffee.temperatureOptions.isEmpty {
                HStack(spacing: 24) {
                    ForEach(coffee.temperatureOptions) { temp in
                        Button(action: {
                            withAnimation { selectedTemp = temp }
                        }) {
                            Text(temp.rawValue)
                                .font(.caption)
                                .foregroundColor(selectedTemp == temp ? .white : .gray)
                                .frame(width: 80, height: 30)
                                .background(selectedTemp == temp ? Color.green : Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                    }
                }
            }

            Spacer()
            OrderButton()
                .padding(.bottom)
        }
        .onAppear {
            selectedTemp = coffee.temperatureOptions.first
        }
    }
}

struct CoffeeListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(sampleCoffees) { coffee in
                        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
                            VStack(spacing: 8) {
                                Image(coffee.imageHot)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 120)
                                Text(coffee.nameKor)
                                    .font(.callout)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CoffeeListView()
}
