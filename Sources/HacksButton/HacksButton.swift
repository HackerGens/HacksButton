import SwiftUI

@available(iOS 13.0, *)
public struct HacksButton: View {
    public let text: String
    public let textColor: Color
    public let backgroundColor: Color
    
    // Additional properties
    public let font: Font
    public let cornerRadius: CGFloat
    public let width: CGFloat
    public let height: CGFloat
    public let fontSize: CGFloat
    
    // Define FontScheme
    public struct FontScheme {
        public static func kKodchasanBold(size: CGFloat) -> Font {
            // Provide implementation for kKodchasanBold or use a default font
            // Replace this implementation with your desired font setup
            return Font.system(size: size).bold()
        }
    }
    
    // Define RoundedCorners
    private struct RoundedCorners: Shape {
        let topLeft: CGFloat
        let topRight: CGFloat
        let bottomLeft: CGFloat
        let bottomRight: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            let width = rect.size.width
            let height = rect.size.height
            
            // Create the path
            path.move(to: CGPoint(x: rect.minX + topLeft, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - topRight, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + topRight), control: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRight))
            path.addQuadCurve(to: CGPoint(x: rect.maxX - bottomRight, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + bottomLeft, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - bottomLeft), control: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeft))
            path.addQuadCurve(to: CGPoint(x: rect.minX + topLeft, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
            
            return path
        }
    }
    
    public init(text: String,
                textColor: Color,
                backgroundColor: Color,
                font: Font = FontScheme.kKodchasanBold(size: 20),
                cornerRadius: CGFloat = 8,
                width: CGFloat,
                height: CGFloat,
                fontSize: CGFloat = 20) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.font = font
        self.cornerRadius = cornerRadius
        self.width = width
        self.height = height
        self.fontSize = fontSize
    }
    
    public var body: some View {
        Button(action: {}) {
            HStack(spacing: 0) {
                Text(text)
                    .font(font)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .overlay(RoundedCorners(topLeft: cornerRadius, topRight: cornerRadius, bottomLeft: cornerRadius, bottomRight: cornerRadius)
                        .stroke(Color.green, lineWidth: 3))
                    .background(RoundedCorners(topLeft: cornerRadius, topRight: cornerRadius, bottomLeft: cornerRadius, bottomRight: cornerRadius)
                        .fill(backgroundColor))
            }
        }
        .foregroundColor(textColor)
        .frame(width: width, height: height)
        .cornerRadius(cornerRadius)
    }
}

