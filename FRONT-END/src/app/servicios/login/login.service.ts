import { Injectable } from '@angular/core';
import { usuarios } from '../../models/usuario';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  clientes = usuarios;
  constructor(private router: Router) { }

  login(email: string, password: string ){
    console.log(email, password);
    for(const usuario of this.clientes){
      if(usuario.mail === email){
        if(usuario.clave === password){
          this.router.navigate(['/home'])
        }else{
          //mostrar mensaje pop-up de password incorrecta
          console.log("password incorrecta")
        }
      }else{
        //mostrar mensaje pop-up de email no encontrado, por favor registrate
        this.router.navigate(['/registro'])
        console.log("email no encontrado")
      }
    }
  }
}
