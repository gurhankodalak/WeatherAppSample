//
//  HomeViewController.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import UIKit

class HomeViewController: ViewController {

    enum HomeViewComponents {
        case Hourly
        case Current
        case Daily
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = HomeViewModel()
    private var data: CurrentWeatherDataResponse?
    private var hourlyData: CurrentWeatherHourlyDataResponse?
    private var dailyData: WeatherDailyResponse?
    
    private var components: [HomeViewComponents] = [.Current]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        self.showLoading()
        self.viewModel.getCurrentWeatherData(location: LocationManager.shared.userLocation) { [weak self] data, error in
            guard let self = self else {return}
            self.hideLoading()
            guard let data = data else {
                self.showAlert(message: error ?? "Something went wrong")
                return
            }
            self.data = data
            self.getHourlyData()
            self.tableView.reloadData()
        }
    }

    
    func getHourlyData() {
        self.viewModel.getHourlyWeatherData(location: LocationManager.shared.userLocation) { [weak self] data, error in
            guard let self = self else {return}
            guard let data = data else {
                self.showAlert(message: error ?? "Something went wrong")
                return
            }
            self.hourlyData = data
            self.components.append(.Hourly)
            self.getDailyData()
            self.tableView.reloadData()
        }
    }
    
    func getDailyData() {
        self.viewModel.getDailyWeatherData(location: LocationManager.shared.userLocation) { [weak self] data, error in
            guard let self = self else {return}
            guard let data = data else {
                self.showAlert(message: error ?? "Something went wrong")
                return
            }
            self.dailyData = data
            self.components.append(.Daily)
            self.tableView.reloadData()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.components.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch components[indexPath.row] {
        case .Current:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherInfoTableViewCell") as? CurrentWeatherInfoTableViewCell else {
                preconditionFailure("Cell can't dequeued, check identifier")
            }
            if let data = self.data {
                cell.loadWeatherData(data: data)
            }
            return cell
        case .Hourly:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyWeatherInfoTableViewCell") as? HourlyWeatherInfoTableViewCell else {
                preconditionFailure("Cell can't dequeued, check identifier")
            }
            if let data = self.hourlyData {
                cell.hourData = self.viewModel.getTodayHourlyWeatherData(data: data)
            }
            return cell
        case .Daily:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherItemTableViewCell") as? DailyWeatherItemTableViewCell else {
                preconditionFailure("Cell can't dequeued, check identifier")
            }
            if let data = self.dailyData?.daily {
                cell.loadData(items: data)
            }
            return cell
        }
        
    }
}

