import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { DataService } from 'src/app/service/data.service';


@Component({
  selector: 'app-inicio-sesion',
  templateUrl: './inicio-sesion.component.html',
  styleUrls: ['./inicio-sesion.component.css']
})
export class InicioSesionComponent{

  loginForm: FormGroup;

  constructor(private dataService:DataService) {

    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required,Validators.minLength(8), Validators.maxLength(15)]),
    });
  }

  onSubmit() {
    if (this.loginForm.valid) {
      console.log(this._v());
    }
  }
  _v() {
    return this.loginForm.value;
  }

  get passField() {
    return this.loginForm.get("password");
  }

  get passInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }

  cambiarEstado(){
    this.dataService.bandera$.emit(true);
  }
}