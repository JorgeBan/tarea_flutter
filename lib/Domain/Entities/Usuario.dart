
class Usuario{
  final String nombre;
  final String correo;
  final int telefono;
  final String direccion;
  final String genero;
  final String pass;
  
  const Usuario({
   
  required this.nombre, 
  required this.correo, 
  required this.telefono, 
  required this.direccion, 
  required this.genero, 
  required this.pass
  });

  Map<String, dynamic> toMap(){
    return{
      'nombre': nombre,
      'correo': correo,
      'telefono' : telefono,
      'direccion': direccion,
      'genero': genero,
      'pass': pass
    };
  }
}