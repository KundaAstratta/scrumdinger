//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by C HUMBERT on 02/11/2021.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex : Int
    let totalSpeakers : Int
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex)+1.0)
    }
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.origin.x + rect.size.width / 2.0,
                              y: rect.origin.y + rect.size.height / 2.0)
  
        return Path {path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    var scrumColor: Color
    private var currentSpeaker: String { speakers.first(where: { !$0.isCompleted })?.name ?? "Someone" }
    var body: some View {
        ZStack{
            Circle().strokeBorder(lineWidth: 24, antialiased: true)
            VStack{
                Text(currentSpeaker).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("is speaking")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)
        }
        .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "Kim", isCompleted: true), ScrumTimer.Speaker(name: "Bill", isCompleted: false)]

    static var previews: some View {
        MeetingTimerView(speakers: speakers, scrumColor: Color("Design"))
    }
}
