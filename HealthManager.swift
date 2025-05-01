//
//  HealthManager.swift
//  ThriveCheckAI
//
//  Created by TedavanInc on 4/19/25.
//

import Foundation
import HealthKit

class HealthManager {
    let healthStore = HKHealthStore()

    // Request HealthKit Authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false)
            return
        }

        let readTypes: Set<HKObjectType> = [
            // Heart & Activity
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
            
            // Sleep
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
            
            // Advanced Metrics
            HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
            HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
            HKObjectType.quantityType(forIdentifier: .vo2Max)!,
            
            // Mindfulness
            HKObjectType.categoryType(forIdentifier: .mindfulSession)!,
            
            // Blood Oxygen & Body Temperature
            HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
            HKObjectType.quantityType(forIdentifier: .bodyTemperature)!,
            
            // Hydration
            HKObjectType.quantityType(forIdentifier: .dietaryWater)!
        ]

        healthStore.requestAuthorization(toShare: [], read: readTypes) { success, error in
            if let error = error {
                print("Authorization failed: \(error.localizedDescription)")
            }
            completion(success)
        }
    }

    // Fetch latest heart rate sample
    func fetchLatestHeartRate(completion: @escaping (Double?) -> Void) {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            completion(nil)
            return
        }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (_, results, _) in
            guard let sample = results?.first as? HKQuantitySample else {
                completion(nil)
                return
            }

            let value = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            completion(value)
        }

        healthStore.execute(query)
    }
}
