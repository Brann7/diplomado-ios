import UIKit

import Foundation
var weather: String = "Nieve"
var time = 12
var dark = Array(0...6) + Array(19...23) // DE 0 A 6 (INCLUYE A 0 Y AL 6)
var light = 7...18
if weather == "Lluvia"{
    print("🌧️")
}else{
    print("❄️")
}
//option + N = ~
if light ~= time{
    print("Usa bloqueador")
}else{
    print("No necesitas bloqueador")
}
