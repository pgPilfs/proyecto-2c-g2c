import { Injectable } from '@angular/core';
import { usuarios, Usuario } from '../../models/usuario';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class RegistroService {
  clientes = usuarios;

  constructor(private router: Router) { }
  registro(cliente: Usuario ){
    console.log(cliente);
    for(const usuario of this.clientes){
      if(usuario.mail === cliente.mail){
        //mostrar mensaje pop-up de email encontrado, por favor loguearse
        this.router.navigate(['/login'])
        console.log("email encontrado")
      }else{
        this.clientes.push(cliente)
        //mostrar mensaje pop-up de registro exitoso
        this.router.navigate(['/login'])
        console.log("email no encontrado")
      }
    }
  }
}



