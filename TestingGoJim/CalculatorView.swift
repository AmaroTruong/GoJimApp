//
//  CalculatorView.swift
//  TestingGoJim
//
//  Created by Amaro Truong on 6/24/23.
//

import SwiftUI

struct CalculatorView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi = ""
    @State private var gender = ""
    @State private var age = ""
    @State private var mc = ""
    
    
    
    
    var body: some View {
        ZStack {
            Color("LightRed")
                .ignoresSafeArea()
            VStack {
                Group {
                    TextField("Weight(lbs)", text: $weight)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    TextField("Height(inches)", text: $height)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    Button("Calculate BMI") {
                        calculateBMI()
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(.black)
                    .cornerRadius(15)
                    .padding()
                    
                    Text(bmi)
                }
                VStack{
                    Group {
                        
                        TextField("Age(Years)", text: $age)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Weight(lbs)", text: $weight)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Height(inches)", text: $height)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Select Gender")
                            .font(.body)
                        Picker("Gender", selection: $gender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        
                        Text("Selected Gender: \(gender)")
                        
                        Button("Calculate MC") {
                            calculateMC()
                        }
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(.black)
                        .cornerRadius(15)
                        .padding()
                        
                        Text(mc)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    func calculateBMI() {
        // guard is a form of input validation
        guard let weightValue = Double(weight),
              let heightValue = Double(height),
              weightValue > 0,
              heightValue > 0
        else {
            bmi = "Invalid input"
            return
        }
        // "square function, divide weight (lb) by height (in) squared, multiply by 703, and round to one decimal place.
        
        let bmiValue = weightValue / (heightValue * heightValue) * 703
        bmi = String(format: "Your BMI is: %.1f", bmiValue)
    }
    
    
    func calculateMC() {
        if let ageValue = Double(age),
           let weightValue = Double(weight),
           let heightValue = Double(height),
           weightValue > 0,
           heightValue > 0 {
            
            if gender == "Male" {
                mc = String(format: "Your maintenance calories is %.f", (66 + (6.23 * weightValue) + (12.7 * heightValue) - (6.8 * ageValue)))
            } else if gender == "Female" {
                mc = String(format: "Your maintenance calories is %.f", (655 + (4.35 * weightValue) + (4.7 * heightValue) - (4.7 * ageValue)))
            }
        } else {
            mc = "Invalid input"
            return
        }
    }
    
   
    struct CalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            CalculatorView()
        }
    }
}
