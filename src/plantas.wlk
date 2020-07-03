class Planta {
	
	const property anioDeObtencionDeSemilla = 0
	const property altura = 0
	
	
	method horasDeSolQueTolera() = caracteristica.tolerancia()
	method esFuerte() = self.horasDeSolQueTolera() > 9
	method daNuevasSemillas() = self.esFuerte()
	method espacioQueOcupa()
}

class Menta inherits Planta
{
	override method espacioQueOcupa() = self.altura() *3
	override method daNuevasSemillas() =super() or self.espacioQueOcupa() > 1
	method esParcelaIdeal(unaParcela)= unaParcela.superficie() > 6
}

class Soja inherits Planta
{
	override method horasDeSolQueTolera() = 
	if (altura < 0.5 ){6} 
	else if (altura.between(0.5, 1)){8}
	else 12
	
	override method daNuevasSemillas() = super() or self.condicionAlternativa()
	method condicionAlternativa() = anioDeObtencionDeSemilla > 2007 and altura.between(0.75, 0.9)
	override method espacioQueOcupa() = altura/2
	method esParcelaIdeal(unaParcela) = unaParcela.horasDeSol() == self.horasDeSolQueTolera() 
}

class Quinoa inherits Planta
{
	var property espacioQueOcupa = 0
	override method horasDeSolQueTolera() 
	{
		if (espacioQueOcupa < 0.3)
		{
			return 10
		} 
		else return caracteristica.tolerancia()
	} 
	override method daNuevasSemillas() =super() or anioDeObtencionDeSemilla < 2005
	method esParcelaIdeal(unaParcela) = unaParcela.plantas().all({p => p.altura() < 1.5})
	 
}

class SojaTransgenica inherits Soja 
{
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaximaDePlantas () == 1
}

class Peperina inherits Menta
{
	override method espacioQueOcupa() = super()*2
}

object caracteristica 
{
	var property tolerancia = 7
}