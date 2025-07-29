struct HomeCollapseTopBar: View {
    
    var topEdge : CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Image("choclate")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            Text("Shopping")
                .font(.largeTitle)
                .bold()
            

            Text("Creamy Choclate truffle Cake, best chocolate cake in town")
                .fontWeight(.semibold )
                .foregroundStyle(.white).opacity(0.8)
            
            
            
        }
        .padding()
        .padding(.bottom)
       
    }
}