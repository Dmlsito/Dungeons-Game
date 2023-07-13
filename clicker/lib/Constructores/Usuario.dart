class Usuario {
  int id;
  String nombre;
  String contrasena;

  Usuario({required this.id, required this.nombre, required this.contrasena});

  int getId() {
    return this.id;
  }

  String getNombre() {
    return this.nombre;
  }

  String getContrasena() {
    return this.contrasena;
  }
}
