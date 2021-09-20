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
      
      clave: ['', Validators.compose([Validators.required, Validators.minLength(8)])],
      clave2: ['', Validators.compose([Validators.required, Validators.minLength(8)])],
      email: ['', Validators.compose([Validators.required, Validators.email])],
    })
  }

  
  enviar(values: Usuario) {
    this.serv.registro(values);
  }

  ngOnInit(): void {

  }

  
}
/*ESTO ES LO QUE HIZO PROFE YO LO EDITE A LO Q ESTABA YA ACA,
HABRÍA QUE TERMINARLO INTENTE PERO ME SALTA ERROR Y YA NO SE DONDE =(

/*import { Component, OnInit } from '@angular/core';
import {Validators, FormGroup, FormBuilder} from '@angular/forms';
import { Usuario, usuarios } from '../../models/usuario';
import { RegistroService} from '../../servicios/registro.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})

export class RegistroComponent  {
  /*form:FormGroup;*/
  /*cliente: Usuario = new usuario();*/
  
  /*signupForm: FormGroup; 


  constructor(private formBuilder: FormBuilder, private serv: RegistroService, private router: Router) {
    this.signupForm = this.formBuilder.group({

      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      dni: ['', Validators.compose([Validators.required])],
      fechaNacimiento:['', [Validators.required]],
      clave: ['', Validators.compose([Validators.required, Validators.minLength(8), Validators.pattern('[a-zA-Z ]*')])],
      clave2: ['', Validators.compose([Validators.required, Validators.minLength(8)])],
      email: ['', Validators.compose([Validators.required, Validators.email])],
    
    })
  }
 
  
 enviar(values: Usuario) {
    this.serv.registro(values);
  }
  /*

   

onEnviar(event: Event, cliente: Usuario): void{
  event.preventDefault;
  if (this.form.valid){
    console.log(cliente);
    this.registroService.onCrearRegistro(cliente).subscribe(
      data =>{
        console.log(data);
        if (data['Id']>0)
        {
          alert("El registro ha sido exitoso. Puede iniciar sesión.");
          this.router.navigate(['./iniciar-sesion'])
        }
      })
  }
  else
  {
    this.form.markAllAsTouched(); 
  }
};


  ngOnInit(): void {

  }
}
 */ 