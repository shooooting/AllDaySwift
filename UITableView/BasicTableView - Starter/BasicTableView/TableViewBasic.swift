//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
    
    tableView.dataSource = self // 꼭 적어줘야 한다 !! 실수를 많이 한다.
    /*
     재사용할 셀의 클래스를 미리 등록 가능
     새로운 아이디 -> 새로 등록
     같은 아이디 -> 이전에 등록한 클래스 업데이트
     */
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    //UITableViewCell.self -> 어떤 인스턴스를 생성할 거야
  }
}


// MARK: - UITableViewDataSource

extension TableViewBasic: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // 하나의 섹션에 10개를 넣겠다.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1번 - 기본 셀 생성 : 만들기만 하는 코드 <이런코드를 짜면안돼 !!> 셀을 무조건 다 만듬
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        // 2번 - 셀 재사용 - 셀의 개수가 1만개 또는 그 이상일 경우 = > 셀 재사용 필요 // 2번 방법을 써야 한다 !
        // tableView.dequeueReusableCell(withIdentifier: "CellID")
        // 리턴 타입 -> Optional. 즉, 최초에는 일단 만들어줘야 함
//        let cell: UITableViewCell
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID") { // 재사용
//            cell = reusableCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID") // 새로 만듬
//        }
//        cell.textLabel?.text = "\(indexPath.row)" // 텍스트 넣기
//        return cell
        
        // 3번 - 미리 셀을 등록
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
//        print(indexPath.row)
        cell.textLabel?.text = "\(indexPath.row)"
        //indexPath -> 각각의 행마다 들어오는 값
        return cell
    }
     
}



