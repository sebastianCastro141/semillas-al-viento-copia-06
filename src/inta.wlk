import plantas.*
import parcelas.*
object inta
{
	var property parcelas = []
	
	method promedioDePlantasPorParcela()= parcelas.sum({p => p.plantas().size()})/parcelas.size()
	
	method parcelaMasAutoSustentable() 
	{
		var masDeCuatroPlantas = parcelas.filter({p => p.plantas().size() >= 4})
		masDeCuatroPlantas.filter({ p => p.sustentanble()})
	}	
}
