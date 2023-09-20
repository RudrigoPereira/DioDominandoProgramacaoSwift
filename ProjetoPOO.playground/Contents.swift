import UIKit

class Carro {
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
    
    // Exemplo de enumeração
    enum EstadoCarro {
        case ligado
        case desligado
    }
    
    // Exemplo de função que utiliza um controle de fluxo (if/else)
    func verificarEstado() -> EstadoCarro {
        if ligado {
            return .ligado
        } else {
            return .desligado
        }
    }
}

// Instância de Carro
let meuCarro = Carro(marca: "Toyota", modelo: "Corolla", ano: 2022)

// Interagindo com a instância de Carro
meuCarro.ligar()
meuCarro.desligar()

// Exemplo de uma coleção (array) de carros
var frota: [Carro] = []
frota.append(meuCarro)

// Exemplo de uma closure
let ligarCarro: () -> Void = {
    meuCarro.ligar()
}

let desligarCarro: () -> Void = {
    meuCarro.desligar()
}

ligarCarro()
desligarCarro()

// Exemplo de concorrência usando Dispatch Queues
import Dispatch

let queue = DispatchQueue(label: "com.example.carQueue")

queue.async {
    print("Iniciando uma tarefa em segundo plano.")
    sleep(2) // Simulando uma operação demorada
    print("Tarefa em segundo plano concluída.")
}

print("Continuando a execução no primeiro plano.")

