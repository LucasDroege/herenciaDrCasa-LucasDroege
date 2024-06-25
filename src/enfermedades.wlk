
class Enfermedad {
	var property celulasAmenazadas 
	var property tiempo = 0
	var property esAgresiva = false
	var property totalCelulas = 0
	const property enf1 = new Malaria(celulasAmenazadas = 500)
	const property enf2 = new Lupus(celulasAmenazadas = 10000)
	const property enf3 = new Malaria(celulasAmenazadas = 800)
	method pasarDia(){}
	
}
class EnfermedadInfecciosa inherits Enfermedad {
	override method esAgresiva() {
		esAgresiva = celulasAmenazadas > totalCelulas * 0.1
	} 
	
	}
class Malaria inherits EnfermedadInfecciosa{
	override method pasarDia(){
		celulasAmenazadas = celulasAmenazadas * 2 
	}
}
class Otitis inherits EnfermedadInfecciosa{
	
}
class EnfermedadAutoInmune inherits Enfermedad {
	
}
class Lupus inherits EnfermedadAutoInmune {
	override method celulasAmenazadas() = celulasAmenazadas * 2
	override method esAgresiva() {esAgresiva = tiempo > 30} 
}
class Medicamentos {
	var property dosis
}