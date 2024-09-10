//
//  ViewController.swift
//  HelloHTML
//
//  Created by Jongwook Park on 7/12/24.
//

import UIKit

enum GettingHTMLError: Error {
    case urlError
    case urlSeesionError
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var reusltTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getHTML(_ sender: Any) {
        Task {
            do {
                let data: Data = try await requestHTML(from: "https://techit.education")
                
                if let result: String = String(data: data, encoding: .utf8) {
                    reusltTextView.text = result
                }
                
            } catch GettingHTMLError.urlError {
                reusltTextView.text = "잘못된 URL입니다"
            } catch GettingHTMLError.urlSeesionError {
                reusltTextView.text = "데이터를 가져오는 데 문제 발생"
            } catch {
                reusltTextView.text = "알 수 없는 오류 발생"
            }
        }
    }
    
    func requestHTML(from urlString: String) async throws -> Data {
        // url이 정상적으로 만들어지는가?
        guard let url = URL(string: urlString) else {
            throw GettingHTMLError.urlError
        }
        
        // url에서 데이터 가져오기...
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            print(response)
            
            return data
        } catch {
            throw GettingHTMLError.urlSeesionError
        }
    }
}

