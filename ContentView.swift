
import SwiftUI

struct ContentView: View {
    @State private var quantities = Array(repeating: 0, count: cafeMenu.count)
    
    @State private var showConfirmation = false
    
    var total: Double {
        cafeMenu.reduce(0.0) { sum, item in
            sum + item.price * Double(quantities[item.id])
        }
    }

    var itemCount: Int {
        quantities.reduce(0, +)
    }

    
    var body: some View {
        ZStack {
            Color(red: 0.973, green: 0.953, blue: 0.929)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    Image(systemName: "moon.stars.fill")
                        .font(.system(size: 55))
                        .foregroundStyle(.blue)

                    Text("Little Moon Café")
                        .font(.largeTitle.bold())

                    Text("A little magic in every cup")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Divider()

                    Text("Our Menu")
                        .font(.title2.bold())

                    
                    ForEach(cafeMenu) { item in
                        MenuItemCard(
                            item: item,
                            quantity: $quantities[item.id]
                        )
                    }
                    
                    
                    VStack(spacing: 15) {
                        Text("Your Order")
                            .font(.title2.bold())

                        // Conditional UI: Only show this when the cart is empty.
                        if itemCount == 0 {
                            Text("Your basket is waiting for something delicious!")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        } else {
                            Text("You have \(itemCount) item(s) in your basket!")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Divider()

                        HStack {
                            Text("Total")
                                .font(.headline)

                            Spacer()

                            Text(total, format: .currency(code: "USD"))
                                .font(.title2.bold())
                                .foregroundStyle(
                                    Color(red: 0.412, green: 0.498, blue: 0.655)
                                )
                        }
                        
                        
                        Button {
                            showConfirmation = true
                        } label: {
                            HStack {
                                Spacer()

                                Image(systemName: "moon.stars.fill")

                                Text("Place Order")
                                    .fontWeight(.semibold)

                                Spacer()
                            }
                            .padding()
                            .foregroundStyle(.white)
                            .background(
                                itemCount == 0
                                ? Color.gray
                                : Color(red: 0.412, green: 0.498, blue: 0.655)
                            )
                            .cornerRadius(14)
                        }
                        .disabled(itemCount == 0)

                        
                    }
                    .padding(20)
                    .background(.white)
                    .cornerRadius(18)

                }
                .padding()
            }
        }
        
        .alert("Order Confirmed!", isPresented: $showConfirmation) {
                    Button("Done") {
                        quantities = Array(
                            repeating: 0,
                            count: cafeMenu.count
                        )
                    }
                } message: {
                    Text("Thank you for ordering from Little Moon Café! Your total is \(total.formatted(.currency(code: "USD"))).")
        }
        
    }
}

#Preview {
    ContentView()
}

