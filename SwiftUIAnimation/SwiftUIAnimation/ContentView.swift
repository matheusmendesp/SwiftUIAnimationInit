//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Matheus Mendes Peres on 21/01/22.
//

import SwiftUI

struct ContentView: View {
	
	@State var shouldAnimate = false
	@State private var degrees = 0.0
	let speed: TimeInterval = 4
	
	var body: some View {
		ZStack{
			Leaf(size: 150)
				.fill(Color.blue)
				.rotationEffect(.degrees(degrees))
			Leaf(size: 150)
				.fill(Color.red)
				.rotationEffect(.degrees(degrees + 45))
			Leaf(size: 150)
				.fill(Color.black)
				.rotationEffect(.degrees(degrees + 90))
			Leaf(size: 150)
				.fill(Color.blue)
				.rotationEffect(.degrees(degrees + 135))
			
			Text("Hello Word Animation")
				.font(.title)
				.foregroundColor(.black)
				.padding(.top, 400)
		}
		.frame(alignment: .center)
		.onAppear {
			withAnimation(Animation.linear(duration: speed).repeatForever(autoreverses: false)){
				degrees += 360
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


struct Leaf: Shape {
	
	var size: CGFloat = 0
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: rect.midX, y: rect.midY))
		path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY - size), control: CGPoint(x: rect.midX + size/4, y: rect.midY -  size/2))
		
		path.move(to: CGPoint(x: rect.midX, y: rect.midY))
		path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY - size), control: CGPoint(x: rect.midX - size/4, y: rect.midY -  size/2))
		
		path.move(to: CGPoint(x: rect.midX, y: rect.midY))
		path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY + size), control: CGPoint(x: rect.midX + size/4, y: rect.midY +  size/2))
		
		path.move(to: CGPoint(x: rect.midX, y: rect.midY))
		path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY + size), control: CGPoint(x: rect.midX - size/4, y: rect.midY +  size/2))
		
		return path
	}
}

