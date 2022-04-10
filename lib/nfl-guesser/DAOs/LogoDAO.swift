//
//  LogoDAO.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 4/3/22.
//

import AWSS3
import Foundation

@MainActor class LogoDAO: ObservableObject {
    
    @Published var logo: UIImage?
    
//    func fetchLogo(of college: String) async {
//        return await withCheckedContinuation { continuation in
//            load(college) { logo in
//                DispatchQueue.main.async {
//                    self.logo = logo
//                    continuation.resume()
//                }
//            }
//        }
//    }
    
    func fetchLogo(of college: String) {
        load(college) { logo in
            DispatchQueue.main.async {
                self.logo = logo
            }
        }
    }
    
    private func load(_ college: String, completion: @escaping (UIImage) -> Void) {
        let expression = AWSS3TransferUtilityDownloadExpression()
            expression.progressBlock = {(task, progress) in DispatchQueue.main.async {
                // Do something e.g. Update a progress bar.
            }
        }

        var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?
        completionHandler = { (task, URL, data, error) -> Void in
            DispatchQueue.main.async {
                guard let data = data else { return }
                let logo = UIImage(data: data) ?? UIImage()
                completion(logo)
            }
        }

        let transferUtility = AWSS3TransferUtility.default()
        transferUtility.downloadData(
            fromBucket: "nfl-guesser",
            key: "logos/college/\(college).png",
            expression: expression,
            completionHandler: completionHandler
            ).continueWith {
                (task) -> AnyObject? in if let error = task.error {
                    print("Error: \(error.localizedDescription)")
                }

                if let _ = task.result {
                    // Do something with downloadTask.
                }
                return nil;
            }
    }
    
    public init() { }
}
