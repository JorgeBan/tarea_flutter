import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarea3/Domain/Entities/Usuario.dart';
import 'package:tarea3/Domain/Repositories/abstract_authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseAuthenticationRepository extends AbstractAuthentication{
  
  late var _auth;
   User? _user;
  
  FirebaseAuthenticationRepository(){
     _auth = FirebaseAuth.instance;
    _init();
  }
  


  void _init(){
    _auth.authStateChanges()
    .listen((User? user) {
      _user = user;
      print(_user.toString());
     });
  }

  @override
  Future<User?> usuario() async{
    return  _user;
  }

  @override
  Future<String> doLogin(String email, String password) async{ 
    try{
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        _user = userCredential.user;
        return _user.toString();
    }on FirebaseAuthException catch(error){
      return Future.error(error);
    }catch(error){
      return Future.error(error);
    }
  }

  @override
  Future<void> doLogout() async{
    await _auth.signOut();
  }

  @override
  Future<String> register(Usuario usuario) async{
      try{
        
     
        UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: usuario.correo, password: usuario.pass);
        
          CollectionReference usuarios = FirebaseFirestore.instance.collection('Usuarios');
          _auth = userCredential.user;
          usuarios.add(usuario.toMap())
          .then((value)=> 
              
              print("Registro exitoso")
          ).catchError((onError) async{
            await FirebaseAuth.instance.currentUser!.delete();
            return Future.error(onError);
          });
        return userCredential.user.toString();
      }on FirebaseException catch(error){
        return Future.error(error);
      }catch(error){
        return Future.error(error);
      }
  }

}