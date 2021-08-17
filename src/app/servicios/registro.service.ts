import { Injectable } from '@angular/core';
import { usuarios, Usuario } from '../models/usuario';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class RegistroService {
  clientes = usuarios;
  registrado: boolean;
  dniEnUso: boolean;

  constructor(private router: Router) { }
  registro(cliente: Usuario ){
    delete this.registrado;
    for(const usuario of this.clientes){
      debugger
      if(usuario.mail === cliente.mail){
        this.registrado = true;
        break
      };
      if(usuario.dni === cliente.dni){
        this.registrado = true;
        this.dniEnUso = true;
        break
      }
    }

    if(this.registrado){
      //mostrar mensaje pop-up de email encontrado, por favor loguearse
      // this.router.navigate(['/login'])
      console.log("email encontrado")
    }else{
      this.clientes.push(cliente);
      //mostrar mensaje pop-up de registro exitoso
      //no dirigir al login, diseñar una vista para que el cliente toque loguearse
      console.log("email no encontrado");
    }
    if(this.dniEnUso){
      console.log('dni encontrado')
    }else{
      console.log('dni no encontrado')
    }

  }

}

