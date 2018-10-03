// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar(){ return universidad.provincia().asSet() }
	method honorariosPorHora(){
		return universidad.honorarios()
	}
}

class Universidad {
	var honorarios
	var provincia 
	
	method provincia(prov){
		provincia = prov
	}
	method provincia(){
		return provincia
	}
	
	method honorarios(){
		return honorarios
	}
	
	method honorarios(monto){
		honorarios = monto
	}
}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var honorarios
	var provinciasDondeTrabaja = #{}
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar(){
		return provinciasDondeTrabaja
	}
	method provinciasDondePuedeTrabajar(provincias){
		provinciasDondeTrabaja = provincias
		}
	method honorariosPorHora() {
		return  honorarios
  }
  method honorariosPorHora(honorario){
  	honorarios = honorario
  }
}

class EmpresaDeServicios{
	var profesionalesContratados = #{}
	var honorarioDeReferencia 
	
	method honorarioDeReferencia(){
		return honorarioDeReferencia
	}
	
	
	method honorarioDeReferencia(monto){
		honorarioDeReferencia = monto
	}
	
	method contratar(profesional){
		profesionalesContratados.add(profesional)
	}
	method profesionalesCaros(){
			return profesionalesContratados.filter { profesional => profesional.honorariosPorHora() > self.honorarioDeReferencia()}.asSet()	
	}
	
	method universidadesFormadoras(){
		 var formadoras =  profesionalesContratados.map{ profesional => profesional.universidad() }.asList() 
		 return formadoras.asSet()
	}
	
	method elMasBarato(){
	return profesionalesContratados.min { profesional => profesional.honorariosPorHora()}	
	}
	
	method provinciaEstaCubierta(provincia){
	return profesionalesContratados.any { profesional => profesional.provinciasDondePuedeTrabajar().contains(provincia)}
	}
	
	method estudiarionEn(unaUniversidad){
		var graduados = profesionalesContratados.filter { profesional => profesional.universidad() == unaUniversidad}.asSet()
		return graduados.size()
	}
}



