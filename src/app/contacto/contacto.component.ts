import { Component, OnInit} from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.component.html',
  styleUrls: ['./contacto.component.css']
})

export class ContactoComponent implements OnInit {
  mensajeForm: FormGroup;
  mostrar = false;
  mostrar2 = false;
  //mostrar3 = false;

  onClick1(){
    this.mostrar = !this.mostrar; 
  }
  onClick2(){
    this.mostrar2 = !this.mostrar2;
  }
  /*onClick3(){
    this.mostrar3 = !this.mostrar3;
  }*/
    
  constructor(private formBuilder: FormBuilder) {
    this.mensajeForm = this.formBuilder.group({
      usuario: ['', Validators.compose([Validators.required, Validators.minLength(4)])],
      password: ['', Validators.compose([Validators.required, Validators.minLength(6)])],
    })
  }
  
  
    
  

  ngOnInit(): void {
  }

}
