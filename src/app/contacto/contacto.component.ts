import { Component, OnInit} from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.component.html',
  styleUrls: ['./contacto.component.css']
})

export class ContactoComponent implements OnInit {
  contactoForm: FormGroup;
  mostrar1 = false;
  mostrar2 = false;

  onClick1(){
    this.mostrar1 = !this.mostrar1; 
  }
  onClick2(){
    this.mostrar2 = !this.mostrar2;
  }
    
  constructor(private formBuilder: FormBuilder) {
    this.contactoForm = this.formBuilder.group({
      nombre: ['', Validators.required],
      email: ['', Validators.compose([Validators.required, Validators.email])],
      telefono:['',Validators.required],
      mensaje: ['', Validators.compose([Validators.required, Validators.maxLength(300)])]
    })
  }

  enviar(values){
    console.log(values);
  }

  ngOnInit(): void {
  }

}
