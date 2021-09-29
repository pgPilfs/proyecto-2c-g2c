import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LocalidadService {
  url1="http://www.webapigcpil.somee.com/api/Pais"
  url2="http://www.webapigcpil.somee.com/api/Provincia";
  url3="http://www.webapigcpil.somee.com/api/Localidad";

  //private provincias : ProvinciaI[] = [...];
  //private localidades : LocalidadI[] = [...];
  constructor(private http: HttpClient ) { }

  ObtenerPaises()
  {
    return this.http.get<any>(this.url1);
  }

  ObtenerProvincias()
  {
    return this.http.get<any>(this.url2);
  }

  ObtenerLocalidades()
  {
    return this.http.get<any>(this.url3);
  }
  
}

export class PaisI
{
  Id_pais!: number;
  Nombre!: string;
}

export class ProvinciaI
{
  Id_provincia!: number;
  Nombre!: string;
  Id_pais!: number;
}

export class LocalidadI
{
  Id_localidad!: number;
  Nombre!: string;
  Cosdigo_postal!: number;
  Id_provincia!: number;
}
