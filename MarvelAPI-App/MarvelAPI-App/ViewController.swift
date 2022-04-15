//
//  ViewController.swift
//  MarvelAPI-App
//
//  Created by 木元健太郎 on 2022/04/01.
//

import UIKit
import Moya


final class ViewController: UIViewController {

   private let provider = MoyaProvider<Marvel>()
    private  var response:[Results] = []
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
          let cell = UINib(nibName: "TableViewCell", bundle: nil)
          tableView.register(cell, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
            tableView.delegate = self
        }
      }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        provider.request(.comics) { [weak self] result in
          guard let self = self else { return }
            
          switch result {
          case .success(let response):
            do {
                let data = response.data
                guard let responseData = try?JSONDecoder().decode(MarvelModel.self, from: data),
                      let results =  responseData.data?.results
                else {
                    return
                }
                self.response = results
                self.tableView.reloadData()
            } catch {
              print("error")
            }
          case .failure:
              print("error")
          }
        }
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return response.count
  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = response[indexPath.row].urls.map{$0._url}
        print(url)
//        let url = response[indexPath.row].urls.map{$0._url}.description
//
//        guard  let ggg = URL.init(string: url) else {
//            return
//        }
//                     UIApplication.shared.canOpenURL(ggg)
//        UIApplication.shared.open(ggg, options: [:], completionHandler: nil)
    }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
      else { return UITableViewCell() }
      let mavelModel = response[indexPath.row]
    cell.configure(mavelModel: mavelModel)
    return cell
  }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


