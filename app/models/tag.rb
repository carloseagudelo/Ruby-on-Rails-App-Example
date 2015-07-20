class Tag < ActiveRecord::Base
	# En esta clase se pueden hacer validaciones de datosssssssss busqueda de información, relacionar
	# modelos (tablas) entre si.

	# Ejemplo de validacion para el atributo name del modelo (tabla) Tag
	validates :name, presence: true, 
					length: {minimum: 5}

	
end
