//
//  CameraPicker.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//


import SwiftUI
import UIKit

// SwiftUI에서 카메라를 사용할 수 있게 UIKit의 UIImagePickerController를 Wrapping한 구조체
struct CameraPicker: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss  // SwiftUI에서 뷰를 닫기 위한 환경 변수
    var onImagePicked: (UIImage) -> Void // 이미지를 선택했을 때 처리할 클로저

    // SwiftUI <-> UIKit 사이의 중재자(Coordinator) 생성
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // UIKit 뷰 컨트롤러를 생성하여 SwiftUI에서 사용할 수 있게 함
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()      // 카메라 뷰 컨트롤러 생성
        picker.sourceType = .camera                 // 카메라를 소스로 지정
        picker.delegate = context.coordinator       // 델리게이트를 Coordinator로 설정
        return picker
    }

    // 뷰 컨트롤러의 상태가 변경될 때 호출됨 (여기선 딱히 할 일 없음)
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    // Coordinator 클래스 정의 - UIKit의 델리게이트 메서드를 처리
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraPicker // 부모 CameraPicker 참조

        init(_ parent: CameraPicker) {
            self.parent = parent
        }

        // 이미지 선택 완료 시 호출되는 메서드
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.onImagePicked(image) // 선택된 이미지 처리
            }
            parent.dismiss() // 카메라 뷰 닫기
        }

        // 이미지 선택 취소 시 호출되는 메서드
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss() // 카메라 뷰 닫기
        }
    }
}
