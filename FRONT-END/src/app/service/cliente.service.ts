import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  url="http://www.webapigcpil.somee.com/api/cliente";
  url1="http://www.webapigcpil.somee.com/api/cuenta";
  url2="http://www.webapigcpil.somee.com/api/movimiento";

  httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  }

  constructor(private http:HttpClient) { }

  onCrearRegistro(usuario:any):Observable<any>{
    return this.http.post<any>(this.url, usuario, this.httpOptions);
  }

  obtenerUsuarios():Observable<any>{
    return this.http.get<any>(this.url, this.httpOptions);
  }

  obtenerUsuario(id:number):Observable<any>{
    return this.http.get<any>(`${this.url}/${id}`, this.httpOptions);
  }

  obtenerCuenta(idCuenta:number):Observable<any>{
    return this.http.get<any>(`${this.url1}/${idCuenta}`, this.httpOptions);
  }

  obtenerMovimientos(idCuenta:number):Observable<any>{
    return this.http.get<any>(`${this.url2}/${idCuenta}`, this.httpOptions);
  }

}

export class Persona
{
  nombre:string="";
  apellido:string="";
  fechaNacimiento:string;
  dni:number;
  cuil:string="";
  nacionalidad:string="";
  genero:string="";
  idLocalidad:number;
  email:string="";
  contrasena:string="";
  domicilio:string=""
  // imagen_delantera:string="Si";
  // imagen_trasera:string="Si";
}

export class Cuenta
{
  CVU: string;
  Saldo: number;
}


export class Movimiento {
  tipoMov: string;
  monto: string;
  fechaHora: number;
  dibujo: string;
}