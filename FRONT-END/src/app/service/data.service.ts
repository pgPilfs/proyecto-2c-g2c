import { EventEmitter, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {
menuEnabled :boolean=true;
bandera$=new EventEmitter<boolean>(); //observable
  constructor() { }
}