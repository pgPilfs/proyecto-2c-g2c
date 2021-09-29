
import { Component, OnInit } from '@angular/core';
import { FormControl, Validators, FormGroup, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { Persona, ClienteService} from 'src/app/service/cliente.service';
import { LocalidadI, LocalidadService, PaisI, ProvinciaI } from 'src/app/service/localidad.service';
import { Usuario } from '../../models/usuario';


@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit{

  form: FormGroup;

  usuario: Persona = new Persona();
  provincias!: ProvinciaI[];
  localidades!: LocalidadI[];
  paises: PaisI[];
  // localidades4!: LocalidadI[];

  public selectedPais: PaisI = { Id_pais: 0, Nombre: ''};
  public selectedProvincia: ProvinciaI = { Id_provincia: 0, Nombre: '', Id_pais: 0};
  public selectedLocalidad: LocalidadI = { Id_localidad: 0, Nombre: '', Cosdigo_postal: 0, Id_provincia: 0};

  contrasena2: string ="";
  checkPass: boolean = true;
  errorRegister: boolean = false;

  constructor(private formBuilder: FormBuilder, private clienteService: ClienteService, private router: Router, private localidadService: LocalidadService) { 
    this.form= this.formBuilder.group(
      {
        nombre:['',[Validators.required, Validators.minLength(3)]],
        apellido: ['', [Validators.required, Validators.minLength(3)]],
        nacimiento:['', [Validators.required]],
        dni:['', [Validators.required, Validators.minLength(7), Validators.maxLength(8)]],
        cuil:['', [Validators.required, Validators.minLength(11), Validators.maxLength(11)]],
        email:['', [Validators.required, Validators.email]],
        domicilio:['', [Validators.required, Validators.minLength(3)]],
        contrasena:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]],
        contrasena2:['',[Validators.required, Validators.minLength(8), Validators.maxLength(15)]],
      }
    )
  }

  ngOnInit(): void {
    this.localidadService.ObtenerPaises().subscribe(
      data=> {
        this.paises=data;
      }
    );
    this.localidadService.ObtenerProvincias().subscribe(
      data=> {
        this.provincias=data;
      }
    );

    this.localidadService.ObtenerLocalidades().subscribe(
      data=> {
        const resultado = data.filter(item => item.idProvincia == 1)
        this.localidades = resultado;
      }
    );

    this.checkPassDifferent();

    this.usuario.genero = "Femenino";
    this.usuario.nacionalidad = "Argentina";
    this.usuario.idLocalidad = 1;
  }

  onSelectNacionalidad(nacionalidad: any):void {
    this.usuario.nacionalidad = nacionalidad;
  }

  onSelectGenero(genero: any):void {
    this.usuario.genero = genero;
  }

  onSelectPais(id_pais: any):void {
    console.log(id_pais);
  }

  onSelectProvincia(id_provincia: any):void {
    this.localidadService.ObtenerLocalidades().subscribe(
      data=> {
        const resultado = data.filter(item => item.idProvincia == id_provincia)
        this.localidades = resultado;
      }
    );
  }

  onSelectLocalidad(id_localidad: number):void{
    this.usuario.idLocalidad = id_localidad;
  }


  onEnviar(event: Event, usuario:any): void
  {
    event.preventDefault;

    const cliente = JSON.stringify(usuario);

    if (this.form.valid)
    {
      this.clienteService.onCrearRegistro(cliente).subscribe(
        data => {
          if(data === 0){
            this.errorRegister = true;
          }else{
           this.router.navigate(['iniciosesion']); 
          }
        },error =>{
          this.errorRegister = true;
        }
      )
    }
    else
    {
      this.form.markAllAsTouched(); 
    }

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

  get domicilioField() {
    return this.form.get("domicilio");
  }

  get domicilioInvalid() {
    return this.mailField?.touched && !this.mailField.valid;
  }

  get checkPassField() {
    return this.form.get("contrasena2");
  }

  get passField() {
    return this.form.get("contrasena");
  }

  get passInvalid() {
    return this.passField?.touched && !this.passField.valid;
  }
  get pass2Invalid() {
    return this.checkPassField?.touched && !this.checkPassField.valid;
  }

  checkPassDifferent () {
    this.checkPassField.valueChanges.subscribe((res)=>{
      if(res.length >= 8){
        let result;
        if (this.passField.value != this.checkPassField.value) {
          result = false;
          this.form.controls['contrasena2'].setErrors({'incorrect': true});
        }
        else {
          result = true; 
          
        }
        this.checkPass =result;
      }
    })
  }

  mostrarRegistro(){
    this.errorRegister = false;
  }



  

}

