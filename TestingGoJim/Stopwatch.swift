import SwiftUI

struct Stopwatch: View {

    @State private var progressTime = 0
    @State private var isRunning = false

    var hours: Int {
        progressTime / 3600
    }

    var minutes: Int {
        (progressTime % 3600) / 60
    }

    var seconds: Int {
        progressTime % 60
    }

    @State private var timer: Timer?

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                StopwatchUnit(timeUnit: hours, timeUnitText: "HR", color: .black)
                Text(":")
                    .font(.system(size: 48))
                    .offset(y: -18)
                StopwatchUnit(timeUnit: minutes, timeUnitText: "MIN", color: .black)
                Text(":")
                    .font(.system(size: 48))
                    .offset(y: -18)
                StopwatchUnit(timeUnit: seconds, timeUnitText: "SEC", color: .black)
            }

            HStack {
                Button(action: {
                    if isRunning{
                        timer?.invalidate()
                    } else {
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                            progressTime += 1
                        })
                    }
                    isRunning.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 120, height: 50, alignment: .center)
                            .foregroundColor(.black)

                        Text(isRunning ? "Stop" : "Start")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }

                Button(action: {
                    progressTime = 0
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 120, height: 50, alignment: .center)
                            .foregroundColor(.gray)

                        Text("Reset")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}


struct StopwatchUnit: View {

    var timeUnit: Int
    var timeUnitText: String
    var color: Color

    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .fill(color)
                    .frame(width: 75, height: 75, alignment: .center)

                HStack(spacing: 2) {
                    Text(timeUnitStr.substring(index: 0))
                        .font(.system(size: 48))
                        .frame(width: 28)
                    Text(timeUnitStr.substring(index: 1))
                        .font(.system(size: 48))
                        .frame(width: 28)
                }
            }

            Text(timeUnitText)
                .font(.system(size: 16))
        }
    }
}

struct Stopwatch_Previews: PreviewProvider {
    static var previews: some View {
        Stopwatch()
    }
}

extension String {
    func substring(index: Int) -> String {
        let arrayString = Array(self)
        return String(arrayString[index])
    }
}
