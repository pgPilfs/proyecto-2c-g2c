import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ClienteService, Login } from '../../service/cliente.service';
import { Router } from '@angular/router';
import { AuthService } from '../../service/auth/auth.service';



@Component({
  selector: 'app-inicio-sesion',
  templateUrl: './inicio-sesion.component.html',
  styleUrls: ['./inicio-sesion.component.css']
})
export class InicioSesionComponent{

  loginForm: FormGroup;
  idUsuario: number;
  error: string="";
  cliente: Login = new Login(); 

  constructor(private clienteService: ClienteService, 
    private router: Router, private authService: AuthService) {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required,Validators.minLength(8), Validators.maxLength(15)]),
    });
  }

  onEnviar(event: Event, cliente: Login)
  {
    event.preventDefault(); //Cancela la funcionalidad por default.
    if (this.loginForm.valid)
    {
      console.log(this.loginForm.value); //se puede enviar al servidor...
      this.authService.login(this.cliente)
      .subscribe(
        data => {
        console.log("DATA"+ JSON.stringify( data));
        this.router.navigate(['home/movimientos']);
       
        },
        error => {
         this.error = error;
        }
      );
    }
    else
    {
      this.loginForm.markAllAsTouched(); //Activa todas las validaciones
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

}