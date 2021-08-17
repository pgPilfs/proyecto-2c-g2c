import { Component, OnInit } from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';
import { usuarios, Usuario } from '../../models/usuario';
import { RegistroService } from '../../servicios/registro.service';
@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})

export class RegistroComponent implements OnInit {
  
  
  signupForm: FormGroup; 


  constructor(private formBuilder: FormBuilder, private serv: RegistroService) {
    this.signupForm = this.formBuilder.group({
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      dni: ['', Validators.compose([Validators.required])],
      usuario: ['', Validators.compose([Validators.required, Validators.minLength(4)])],
      clave: ['', Validators.compose([Validators.required, Validators.minLength(6)])],
      mail: ['', Validators.compose([Validators.required, Validators.email])],
    })
  }

  enviar(values: Usuario) {
    this.serv.registro(values);
  }

  ngOnInit(): void {

  }

  
}