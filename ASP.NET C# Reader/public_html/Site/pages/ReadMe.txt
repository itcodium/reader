JS

Inicio de la aplicacion

1. Clase para manejar las llamadas ajax (Controler)
	
	TablesControler (tables.js)

2. 	Metodo de llamada Ajax
	
	TableGetAll({ schema:"" ,database: "Northwind" });

	Este metodo internamente maneja 3 parametros	
	
		url: Direccion a donde se hace la llamada ajax
		callback: Funcion que recibe los datos de la llamada Ej: tables_get_callback
		data: json con los datos a enviar.

4. Callback, procesamiento de los datos recibidos
	
		Funcionalidades
		
			- Cargar los datos en una coleccion ya predefinida
			- Mostrar los datos: para mostrar los datos se llama 
				al metodo ShowPanel de la clase (Controler)
	
5. Mostrar datos
	
	Uno de los metodo mas inportantes del controlador es la muestra de datos. 
	Pueden haber vario metodos dependiendo de la funcionalidad que se necesite.
	
		ShowPanel
			- Ocultar spinner ajax
			- Instancia PanelView
			
        ShowPanelText
			- Ocultar spinner ajax
			- Instancia PanelView

6. Vista (View)			
	
	!!! Importante: analizar si se pueden guardar los datos en el controlador para luego 
					pasarselos al panel.
	
	PanelView
		
		Parametros: 
		
			- el: Nombre del template a cargar con los datos
			- title: Recibe el titulo de la ventana	
		
		Metodos
		
			- setView
			- setView_Model
			
			Estos 2 metodos se encargan de:
				
				- De incializar el panel 
				- Cargar los datos en el panel
				- Mostrar datos
			
			La diferencia entre estos 2 metodos es el origen de los datos a mostrar
			
			setView_Model: recibe los datos a mostrar por la vista
			setView: La vista que genera este metodo ya tiene configurado el origen de datos.		
			
	
	Configuracion de los datos usados por la vista:
		
	    var TablesConfig = new ConfigView();
			.SetSwip("TablesSwip");
			.SetTemplate("TablesTemplate");
			.SetPanel("TablePanel");	 
		
		Swip:		Para la vista que usa un touch slide 
		Template:	Nombre del template	
		Panel: 		Panel donde se carga el html generado
	
			
	
	
	

