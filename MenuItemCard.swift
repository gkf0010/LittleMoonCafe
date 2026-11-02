import SwiftUI

struct MenuItemCard: View {
    let item: MenuItem
    @Binding var quantity: Int

    var body: some View {
        HStack(spacing: 12) {
            Text(item.emoji)
                .font(.system(size: 35))
                .frame(width: 60, height: 60)
                .background(
                    Color(red: 0.886, green: 0.839, blue: 0.937)
                )
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.subheadline.bold())

                Text(item.price, format: .currency(code: "USD"))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 4)

            HStack(spacing: 4) {
                Text("\(quantity)")
                    .font(.subheadline.bold())

                // New UI element: Stepper for quantity selection.
                Stepper(
                    "Quantity",
                    value: $quantity,
                    in: 0...10
                )
                .labelsHidden()
                .fixedSize()
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
    }
}


