import { EventEmitter, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  bandera$=new EventEmitter<number>(); //observable
  constructor() { }
}