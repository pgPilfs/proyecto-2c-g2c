
import { Component, OnInit } from '@angular/core';
import { FormControl, Validators, FormGroup, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { Persona, ClienteService, Cuenta } from 'src/app/service/cliente.service';
import { LocalidadI, LocalidadService, ProvinciaI } from 'src/app/service/localidad.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit{

  form: FormGroup;
  signupForm: FormGroup; 

  usuario: Persona = new Persona();
  cuenta: Cuenta = new Cuenta();
  provincias!: ProvinciaI[];
  localidades!: LocalidadI[];
  localidades4!: LocalidadI[];

  public selectedProvincia: ProvinciaI = { Id_provincia: 0, Provinciaa: ''};
  public selectedLocalidad: LocalidadI = { Id_localidad: 0, Nombre: '', Cosdigo_postal: 0, Id_provincia: 0};
  mostrar_localidades=false;

  constructor(private formBuilder: FormBuilder, private clienteService: ClienteService, private router: Router, private localidadService: LocalidadService) { 
    this.form= this.formBuilder.group(
      {
        nombre:['',[Validators.required]],
        apellido: ['', [Validators.required]],
        nacimiento:['', [Validators.required]],
        dni:['', [Validators.required]],
        cuil:['', [Validators.required, Validators.minLength(10), Validators.maxLength(15)]],
        email:['', [Validators.required, Validators.email]],
        contrasena:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]],
        contrasena2:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]],
      }
    )
  }

  ngOnInit(): void {
    this.localidadService.ObtenerProvincias().subscribe(
      data=> {
        console.log(data);
        this.provincias=data;
        console.log(this.provincias);
      }
    );

    this.localidadService.ObtenerLocalidades().subscribe(
      data=> {
        console.log(data);
        this.localidades=data;
        console.log(this.localidades);
      }
    );
  }

  onSelectNacionalidad(nacionalidad: any):void {
    console.log(nacionalidad);
    this.usuario.nacionalidad = nacionalidad;
    console.log(this.usuario.nacionalidad);
  }

  onSelectGenero(genero: any):void {
    console.log(genero);
    this.usuario.genero = genero;
    console.log(this.usuario.genero);
  }

  onSelect(id_provincia: any):void {
    console.log(id_provincia);
    this.localidadService.ObtenerLocalidades().subscribe(
      data=> {
        this.localidades4=data;
        this.localidades = this.localidades4.filter(item => item.Id_provincia == id_provincia);
        this.mostrar_localidades = true;
        console.log(this.localidades);
      }
    );
  }

  onSelectLocalidad(id_localidad: any):void{
    console.log(id_localidad);
    this.usuario.id_localidad = id_localidad;
    console.log(this.usuario.id_localidad);
  }

  onCuenta():void {
    console.log(this.cuenta);
    this.clienteService.onCrearCuenta(this.cuenta).subscribe(
      data => {
        console.log(data);
    })
  }

  onId() {
    this.clienteService.onObtenerId(this.usuario.cuil).subscribe(
      data=>{
        this.cuenta.id_cliente= 1046;
        console.log(this.cuenta.id_cliente);
        this.cuenta.cvu = "0000"+ (1046).toString();
        this.cuenta.numero_de_cuenta = "0000"+ (1046).toString();
        this.cuenta.saldo = 0;
        this.cuenta.id_tipo_cuenta = 1;
        this.onCuenta();
      }
    );
  }


  onEnviar(event: Event, usuario:Persona): void
  {
    event.preventDefault;

    if (this.form.valid)
    {
      console.log(usuario);
      this.clienteService.onCrearRegistro(usuario).subscribe(
        data => {
          console.log(data);
      })
    }
    else
    {
      this.form.markAllAsTouched(); 
    }
    
    this.onId();
      

  }

  get nombreField() {
    return this.form.get("nombre");
  }

  get nombreInvalid() {
    return this.nombreField?.touched && !this.nombreField.valid;
  }

  get apellidoField() {
    return this.form.get("apellido");
  }

  get apellidoInvalid() {
    return this.apellidoField?.touched && !this.apellidoField.valid;
  }

  get nacimientoField() {
    return this.form.get("nacimiento");
  }

  get nacimientoInvalid() {
    return this.nacimientoField?.touched && !this.nacimientoField.valid;
  }

  get dniField() {
    return this.form.get("dni");
  }

  get dniInvalid() {
    return this.dniField?.touched && !this.dniField.valid;
  }

  get cuilField() {
    return this.form.get("cuil");
  }

  get cuilInvalid() {
    return this.cuilField?.touched && !this.cuilField.valid;
  }

  get nacionalidadField() {
    return this.form.get("nacionalidad");
  }

  get nacionalidadInvalid() {
    return this.nacionalidadField?.touched && !this.nacionalidadField.valid;
  }

  get sexoField() {
    return this.form.get("sexo");
  }

  get sexoInvalid() {
    return this.sexoField?.touched && !this.sexoField.valid;
  }

  get localidadField() {
    return this.form.get("localidad");
  }

  get localidadInvalid() {
    return this.localidadField?.touched && !this.localidadField.valid;
  }

  get mailField() {
    return this.form.get("email");
  }

  get mailInvalid() {
    return this.mailField?.touched && !this.mailField.valid;
  }

  get checkPassField() {
    return this.form.get("contrasena");
  }

  checkPassDifferent () {
    let result;
    if (this.passField != this.checkPassField) {
      result = true;
    }
    else {
      result = false; 
    }
    return result;
  }

  get passField() {
    return this.form.get("contrasena");
  }

  get passInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }

}
