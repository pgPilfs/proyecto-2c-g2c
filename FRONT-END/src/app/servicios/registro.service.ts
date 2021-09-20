import { Injectable } from '@angular/core';
import { usuarios, Usuario } from '../models/usuario';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class RegistroService {
  clientes = usuarios;
  registrado: boolean;

  constructor(private router: Router) { }
  registro(cliente: Usuario ){
    delete this.registrado;
    for(const usuario of this.clientes){
      debugger
      if(usuario.mail === cliente.mail){
        this.registrado = true;
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


  }

}


/*DESDE ACA HABIA HECHO LO QUE HIZO LA PROFE PERO ME SALE ALGO MAL =(

/*import { Injectable } from '@angular/core';
import { usuarios, Usuario } from '../models/usuario';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';



@Injectable({
  providedIn: 'root'
})


export class RegistroService {
  
  

  constructor(private http: HttpClient) { }
  url:"http://www.webapigcpil.somee.com/api/cliente";


  onCrearRegistro(cliente: Usuario ):Observable<Usuario>{
    return this.http.post<Usuario>(this.url, cliente);
  }
}

    export class usuario{
 nombre: string="";
 apelllido: string="";
 dni: string="";
 fechaNacimiento: string="";
 mail: string="";
 clave: string="";
 clave2: string="";
    }

*/