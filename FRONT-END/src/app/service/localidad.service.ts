import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LocalidadService {
  url="https://localhost:44332/api/Provincia";
  url2="https://localhost:44332/api/Localidad";
  //private provincias : ProvinciaI[] = [...];
  //private localidades : LocalidadI[] = [...];
  constructor(private http: HttpClient ) { }

  ObtenerProvincias()
  {
    return this.http.get<any>(this.url);
  }

  ObtenerLocalidades()
  {
    return this.http.get<any>(this.url2);
  }
}

export class ProvinciaI
{
  Id_provincia!: number;
  Provinciaa!: string;
}

export class LocalidadI
{
  Id_localidad!: number;
  Nombre!: string;
  Cosdigo_postal!: number;
  Id_provincia!: number;
}