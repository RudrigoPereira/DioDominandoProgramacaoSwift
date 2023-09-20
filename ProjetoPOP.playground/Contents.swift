import UIKit

// Protocolo chamado Veiculo com métodos ligar() e desligar()
protocol Veiculo {
    func ligar()
    func desligar()
}

// Classe Carro que conforma ao protocolo Veiculo
class Carro: Veiculo {
    var marca: String
    var modelo: String
    var ano: Int
    var ligado: Bool = false
    
    init(marca: String, modelo: String, ano: Int) {
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
    }
    
    func ligar() {
        if !ligado {
            print("O carro \(marca) \(modelo) está ligado.")
            ligado = true
        } else {
            print("O carro já está ligado.")
        }
    }
    
    func desligar() {
        if ligado {
            print("O carro \(marca) \(modelo) está desligado.")
            ligado = false
        } else {
            print("O carro já está desligado.")
        }
    }
}

// Enum para representar os estados do veículo
enum EstadoVeiculo {
    case ligado
    case desligado
}

// Função que recebe um veículo e executa operações com base em seu estado
func operarVeiculo(_ veiculo: Veiculo) {
    veiculo.ligar()
    veiculo.desligar()
}

// Array de carros
var frota: [Carro] = []

// Preenchendo o array com carros
let carro1 = Carro(marca: "Toyota", modelo: "Corolla", ano: 2022)
let carro2 = Carro(marca: "Honda", modelo: "Civic", ano: 2022)
frota.append(carro1)
frota.append(carro2)

// Iterando sobre a frota e realizando operações em cada carro
for carro in frota {
    operarVeiculo(carro)
}

// Demonstração de concorrência usando async/await
import Foundation

func operacaoDemorada() async throws {
    print("Iniciando operação demorada.")
    try await Task.sleep(nanoseconds: 2 * 1_000_000_000) // Espera por 2 segundos
    print("Operação demorada concluída.")
}

Task {
    try await operacaoDemorada()
}

print("Continuando a execução no primeiro plano.")

