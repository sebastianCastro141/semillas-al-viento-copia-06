class Parcela {
	
	var property ancho
	var property largo 
	const property horasDeSol
	const plantas = []
	
	
	method superficie () = ancho * largo
	method cantidadMaximaDePlantas () 
	{
		if (largo>3)
		{
			return largo + 4
		}
		else 
		{
			return self.superficie()/2
		}
	}
	method tieneComplicaciones() = plantas.any ({p => p.horasDeSolQueTolera() < horasDeSol})
	method plantarUnaPlanta(unaPlanta)
	{
		if (self.condicionDeNoPlantar(unaPlanta))
		{
			self.error("no se debe plantar")
		}
		else
		{
			plantas.add(unaPlanta)
		}
	}
	method condicionDeNoPlantar(planta) = plantas.size() >= self.cantidadMaximaDePlantas () or 
	(horasDeSol - planta.horasDeSolQueTolera()).between(0,1.99)
	                                
	
	
	
}

class Ecologica inherits Parcela
{
	method seAsociaBienDentro(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.esParcelaIdeal(self)
	
}

class Industriales inherits Parcela
{
	method seAsociaBienDentro(unaPlanta) = plantas.size() <= 2 and unaPlanta.esFuerte()
}
