class Medicos inherits Personas {
	method darMedicamentoA(paciente){
		paciente.recibirMedicamento()
	}
}
class Personas {
	var property dia = 0
	var property estaEnfermo = false
	var property cantidadEnfermedades = 0
	var property enfermedades1 = []
	var property totalCelulas
	const property enf1 = new Malaria(celulasAmenazadas = 500)
	const property enf2 = new Lupus(celulasAmenazadas = 10000)
	const property enf3 = new Malaria(celulasAmenazadas = 800)
	const property medicamento1 = new Medicamentos(dosis = 1500)
	method seEnfermo(){
		estaEnfermo = not(estaEnfermo)
		cantidadEnfermedades = cantidadEnfermedades + 1
	}
	method enfermedad(condicion){
		self.seEnfermo()
		enfermedades1.add(condicion)
	}
	method pasarDia() {
		dia = dia + 1
		enfermedades1.pasarDia()
	}
	method recibirMedicamento(){
		var total = medicamento1.dosis() * 15
	}
}
class Logan inherits Personas {
	var property temperatura = 36
	override method totalCelulas() {
		totalCelulas = 3000000
	}
	method contrajoEnfermedad(){
	self.enfermedad(enfermedades1.enf1())
	self.enfermedad(enfermedades1.enf2())
	}
	method cantidadDeCelulasAmenadas(){
	return 	enfermedades1.sum({x => x.celulasAmenazadas()})
	}
	method peorEnfermedad(){
		return enfermedades1.max({x => x.celulasAmenazadas()})
	}
	method entroEnComa(){
		return (temperatura > 44 or self.cantidadDeCelulasAmenadas() > 999999)
	}
	}
class Fran inherits Personas {
	var property temperatura = 36
	override method totalCelulas() {
		totalCelulas = 3500000
	}
	method contrajoEnfermedad(){
	self.enfermedad(enfermedades1.enf3())
	}
	
}
class Enfermedad {
	var property celulasAmenazadas 
	var property tiempo = 0
	var property esAgresiva = false
	var property totalCelulas = 0
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
