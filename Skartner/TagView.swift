
import SwiftUI

struct TagView: View {
    let tag: String
    let onCrossClick: () -> ()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text(tag)
                .padding(.vertical, 6)
                .padding(.horizontal,12)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(15)
                .frame(maxWidth: 100)
                .lineLimit(1)
                .truncationMode(.tail)
                
                
            
            Button(action: {
                onCrossClick()
            }) {
                Image(systemName: "xmark.circle.fill")
            }.offset(y:-12)
                .padding(.trailing,-12)
            
        }
    }
}

struct TagViewWrapper: View {
    @State var tags = ["Rahul", "Mehak long"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tags, id: \.self) { tag in
                    TagView(tag: tag, onCrossClick: {
                        tags.removeAll { $0 == tag }
                    })
                    
                }
            }
            .padding()
        }
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagViewWrapper()
    }
}
