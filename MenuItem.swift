
import Foundation

struct MenuItem: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let emoji: String
}

let cafeMenu: [MenuItem] = [
    MenuItem(id: 0, name: "Honey Vanilla Latte", price: 5.50, emoji: "☕"),
    MenuItem(id: 1, name: "Lavender Moon Latte", price: 6.00, emoji: "🌙"),
    MenuItem(id: 2, name: "Matcha Cloud", price: 5.75, emoji: "🍵"),
    MenuItem(id: 3, name: "Strawberry Cream Tea", price: 4.75, emoji: "🍓"),
    MenuItem(id: 4, name: "Butter Croissant", price: 3.50, emoji: "🥐"),
    MenuItem(id: 5, name: "Blueberry Muffin", price: 3.75, emoji: "🫐")
]


