import { Component, OnInit} from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-pago-servicios',
  templateUrl: './pago-servicios.component.html',
  styleUrls: ['./pago-servicios.component.css']
})

export class PagoServiciosComponent implements OnInit {
  pagosForm: FormGroup;
  mostrar1 = false;
  mostrar2 = false;
  mostrar3 = false;
  mostrar4 = false;

  open1(){
    this.mostrar1 = !this.mostrar1;
    this.mostrar2 = false;
    this.mostrar3 = false;
    this.mostrar4 = false;
  }
  open2(){
    this.mostrar2 = !this.mostrar2;
    this.mostrar1 = false;
    this.mostrar3 = false;
    this.mostrar4 = false;
  }
  open3(){
    this.mostrar3 = !this.mostrar3; 
    this.mostrar1 = false;
    this.mostrar2 = false;
    this.mostrar4 = false;
  }
  open4(){
    this.mostrar4 = !this.mostrar4;
    this.mostrar1 = false;
    this.mostrar2 = false;
    this.mostrar3 = false;
  }
    
  constructor(private formBuilder: FormBuilder) {
    this.pagosForm = this.formBuilder.group({
      nro_cuenta: ['', Validators.required],
    })
  }

  enviar(values){
    console.log(values);
  }

  ngOnInit(): void {
  }

}