import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-ingresar-dinero',
  templateUrl: './ingresos.component.html',
  styleUrls: ['./ingresos.component.css']
})
export class IngresarDineroComponent implements OnInit {


  IngresoForm: FormGroup;

  constructor(private formBuilder: FormBuilder){
    this.IngresoForm = this.formBuilder.group({
      monto: ['', Validators.compose([Validators.min(0), Validators.required, Validators.max(400000)])],
      saldoDisponible: ['20000']
    });
   }


  ngOnInit(): void {
  }

  // tslint:disable-next-line: typedef
  enviar(values) {
    console.log(values);
  }

}
