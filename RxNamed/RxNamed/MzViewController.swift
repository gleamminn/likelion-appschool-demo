//
//  MzViewController.swift
//  RxNamed
//
//  Created by Jongwook Park on 8/1/24.
//

import UIKit
import RxSwift
import RxCocoa

class MzViewController: UIViewController {
    
    // DisposeBag: RxSwift의 메모리 관리를 위한 객체
    // 뷰 컨트롤러가 해제될 때 모든 구독을 자동으로 해제합니다.
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindUI()
    }
    
    // RxSwift를 사용한 UI 바인딩
    private func bindUI() {
        // RxSwift의 장점 1: 간결성
        // RxSwift의 장점 2: 반응형 프로그래밍
        // RxSwift의 장점 3: 선언적 프로그래밍
        
        textField.rx.text.orEmpty // TextField의 text 속성을 Observable로 변환
            .bind(to: label.rx.text) // TextField의 값 변화를 Label에 바인딩
            .disposed(by: disposeBag) // 구독을 DisposeBag에 추가하여 메모리 관리
        
        // 이 세 줄의 코드로 텍스트 필드의 내용이 변경될 때마다
        // 자동으로 레이블의 텍스트가 업데이트됩니다.
        // 기존의 명령형 프로그래밍 방식에 비해 매우 간결하고 선언적입니다.
    }
}

