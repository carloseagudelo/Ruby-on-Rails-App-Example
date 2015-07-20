class TagsController < ApplicationController

	# Tag con T mayucula hace referencia al modelo tag
	# @tag hae referncia a una variable de instancia de tipo tag que almacena los objetos del Modelo

	# Clase que instancia el index o pagina principal de la aplicacion para el controlador Tag
	def index		
		@tags = Tag.all
	end

	# Clase que instancia un nuevo tag
	def new
		@tag = Tag.new
	end

	# Clase que recoge lo que tengo en la vista, lo organiza en el controlador y lo guarda en 
	# la DB atravez del modelo
	def create
		#instancia un modelo tag con los respectivos campos qu tiene la base de datos.
		@tag = Tag.new(tag_params)

		# Con .save almaceno en la base de datos el objeto ya instanciado retorno 1 correcto 0 false
		if @tag.save
			# Redirecciona a la show (hace otra peticio)
			redirect_to @tag
		else
			# Renderiza (muestra) de nuevo la pagina new en son de que no se guardo corretamente
			render 'new'
		end
	end


	# Clase que instancia una busqueda personalizada de modelo por id paa luego ser mostrada
	def show
		@tag = Tag.find(params[:id])
	end

	# Clase que instancia una busqueda personalizada de modelo por id para luego ser modificada
	def edit
		@tag = Tag.find(params[:id])
	end

	# Clase que instania una busqueda por por id persnalizada
	# Luego hace una actualizacion de estos datos mediante la vista
	# Para luego ser almacenados en la base dedatos
	def update
		@tag = Tag.find(params[:id])

		if @tag.update(tag_params)
			redirect_to @tag
		else 
			render 'edit'
		end
	end

	# Clase elimina de la base de datos un registro el cual es pasado por parametro (id) de este
	def destroy
		@tag = Tag.find(params[:id])

		@tag.destroy
		redirect_to tags_path
	end

	# Opcion de seguridad parametros fuertes strong_params
	# Solo le deja entrar en el controlador los parametros dispuestos a aceptar
	private	#define el metodo como un metodo privado
	def tag_params
		# Permit permite aceptar los parametros pasados como parametros a la funcion en el controlador 
		# :tags -> controlador
		params.require(:tags).permit(:name) 
	end

end
