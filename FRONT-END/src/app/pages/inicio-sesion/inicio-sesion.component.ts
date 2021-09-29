import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { DataService } from 'src/app/service/data.service';
import { ClienteService } from '../../service/cliente.service';
import { Router } from '@angular/router';



@Component({
  selector: 'app-inicio-sesion',
  templateUrl: './inicio-sesion.component.html',
  styleUrls: ['./inicio-sesion.component.css']
})
export class InicioSesionComponent{

  loginForm: FormGroup;
  idUsuario: number;

  constructor(private dataService:DataService, private clienteService: ClienteService, private router: Router) {

    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required,Validators.minLength(8), Validators.maxLength(15)]),
    });
  }

  onSubmit() {
    if (this.loginForm.valid) {
     this.clienteService.obtenerUsuarios().subscribe((res)=>{
      for(const usuario of res){
        if(usuario.Email === this.loginForm.value.email){
          if(usuario.Contrasena === this.loginForm.value.password){
            this.router.navigate(['home']);
            this.idUsuario = usuario.Id;
            this.cambiarEstado();
          }else{
            //mostrar mensaje pop-up de password incorrecta
            console.log("contraseña incorrecta")
          }
        }else{
          //mostrar mensaje pop-up de email no encontrado, por favor registrate
          // console.log("email no encontrado")
        }
      }
     })

    }
  }

  get emailField() {
    return this.loginForm.get("email");
  }

  get emailInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }

  get passField() {
    return this.loginForm.get("password");
  }

  get passInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }

  cambiarEstado(){
    this.dataService.bandera$.emit(this.idUsuario);
  }
}