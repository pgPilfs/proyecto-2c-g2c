import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-extraer-dinero',
  templateUrl: './extraer-dinero.component.html',
  styleUrls: ['./extraer-dinero.component.css']
})
export class ExtraerDineroComponent implements OnInit {

  ExtraerForm: FormGroup;

  constructor(private formBuilder: FormBuilder){
    this.ExtraerForm = this.formBuilder.group({
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

