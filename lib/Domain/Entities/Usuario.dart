class Usuario{
  int id;
  String nombre;
  String correo;
  int telefono;
  String direccion;
  String genero;
  String pass;
  
  Usuario({required this.id, required this.nombre, required this.correo, required this.telefono, required this.direccion, required this.genero, required this.pass});

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'nombre': nombre,
      'correo': correo,
      'telefono' : telefono,
      'direccion': direccion,
      'genero': genero,
      'pass': pass
    };
  } 
}